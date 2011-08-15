require 'fileutils'
require 'tmpdir'

class FckeditorController < ActionController::Base

  UPLOAD_FOLDER = "/fck"
  UPLOADED = "/fck"
  STRANGE_ROOT = RAILS_ROOT + "/public"
  STRANGE_ROOTE = ""
  UPLOADED_ROOT = RAILS_ROOT + "/public" + UPLOADED


  MIME_TYPES = [
	"image/jpg",
	"image/jpeg",
	"image/pjpeg",
	"image/gif",
	"image/png",
	"application/x-shockwave-flash",
	"application/msword",
	"application/msaccess",
	"application/vnd.ms-excel",
	"application/vnd.ms-powerpoint",
	"application/vnd.oasis.opendocument.graphics",
	"application/vnd.oasis.opendocument.text",
	"application/vnd.oasis.opendocument.spreadsheet",
	"application/vnd.oasis.opendocument.presentation",
	"application/vnd.oasis.opendocument.database",
	"application/vnd.sun.xml.calc",
	"application/vnd.sun.xml.impress",
	"application/vnd.sun.xml.writer",
	"application/x-xcf",
	"text/plain",
	"text/html",
	"application/pdf",
	"application/ogg",
	"audio/mpeg",
	"audio/mpegurl",
	"audio/x-mpegurl",
	"image/tiff",
	"video/mpeg",
	"video/mp4",
	"video/qt",
	"video/quicktime",
	"video/x-flv",
	"video/x-ms-wmv",
	"video/x-msvideo",
	"application/zip",
	"application/xml",
	"application/xhtml+xml"
  ]

  ##############################################################################
  # XML Response string
  #
  RXML = <<-EOL
  xml.instruct!
    #=> <?xml version="1.0" encoding="utf-8" ?>
  xml.Connector("command" => params[:Command], "resourceType" => 'File') do
    xml.CurrentFolder("url" => @fck_url, "path" => params[:CurrentFolder])
    xml.Folders do
      @folders.each do |folder|
        xml.Folder("name" => folder)
      end
    end if !@folders.nil?
    xml.Files do
      @files.keys.sort.each do |f|
        xml.File("name" => f, "size" => @files[f])
      end
    end if !@files.nil?
    xml.Error("number" => @errorNumber) if !@errorNumber.nil?
  end
  EOL

  ##############################################################################
  # figure out who needs to handle this request
  #
  def command
    @current_folder = current_directory_path
    @url = upload_directory_path
    if params[:Command] == 'GetFoldersAndFiles' || params[:Command] == 'GetFolders'
      get_folders_and_files
    elsif params[:Command] == 'CreateFolder'
      create_folder
    elsif params[:Command] == 'FileUpload'
      upload_file
    end

    render :inline => RXML, :type => :rxml unless params[:Command] == 'FileUpload'
  end

  def get_folders_and_files(include_files = true)
    @folders = Array.new
    @files = {}
    begin
      @fck_url = upload_directory_path
      @current_folder = current_directory_path
      Dir.entries(@current_folder).each do |entry|
        next if entry =~ /^\./
        path = @current_folder + entry
        @folders.push entry if FileTest.directory?(path)
        @files[entry] = (File.size(path) / 1024) if (include_files and FileTest.file?(path))
      end
    rescue => e
      @errorNumber = 110 if @errorNumber.nil?
    end
  end

  def create_folder
    begin
      @fck_url = current_directory_path
      @url = current_directory_path
      path = @fck_url + params[:NewFolderName]
      if !(File.stat(@fck_url).writable?)
        @errorNumber = 103
      elsif params[:NewFolderName] !~ /[\w\d\s]+/
        @errorNumber = 102
      elsif FileTest.exists?(path)
        @errorNumber = 101
      else
        Dir.mkdir(path,0775)
        @errorNumber = 0
      end
    rescue => e
      @errorNumber = 110 if @errorNumber.nil?
    end
  end

  #def upload_file
  #  begin
  #    load_file_from_params
  #    copy_tmp_file(@new_file) if mime_types_ok(@ftype)
  #  rescue => e
  #    @errorNumber = 110 if @errorNumber.nil?
  #  end
#
  #  render :text => %Q'
  #    <script>
  #       window.parent.OnUploadCompleted(#{@errorNumber}, "#{uploaded_file_path}");
  #    </script>'
  # end
  
  def upload_file
    begin
      @new_file = check_file(params[:NewFile])
      @url = upload_directory_path
      ftype = @new_file.content_type.strip
      if ! MIME_TYPES.include?(ftype)
        @errorNumber = 202
        puts "#{ftype} is invalid MIME type"
        raise "#{ftype} is invalid MIME type"
      else
        path = current_directory_path + "/" + @new_file.original_filename
        File.open(path,"wb",0664) do |fp|
          FileUtils.copy_stream(@new_file, fp)
        end
        @errorNumber = 0
      end
    rescue => e
      @errorNumber = 110 if @errorNumber.nil?
    end

    render :text => %Q'
    <script>
      if (window.parent.frames[\'frmUpload\']) {
        window.parent.frames[\'frmUpload\'].OnUploadCompleted(#{@errorNumber});
      }
    </script>'
  end

  def upload
    self.upload_file
  end

  include ActionView::Helpers::SanitizeHelper

  def check_spelling
    require 'cgi'
    require 'fckeditor_spell_check'

    @original_text = params[:textinputs] ? params[:textinputs].first : ''
    plain_text = strip_tags(CGI.unescape(@original_text))
    @words = FckeditorSpellCheck.check_spelling(plain_text)

    render :file => "#{Fckeditor::PLUGIN_VIEWS_PATH}/fckeditor/spell_check.rhtml"
  end

  #################################################################################
  #
  private

  def load_file_from_params
    @new_file = check_file(params[:NewFile])
    @fck_url  = upload_directory_path
    @ftype     = @new_file.content_type.strip
    log_upload
  end

  ##############################################################################
  # Chek if mime type is included in the MIME_TYPES
  #
  def mime_types_ok(ftype)
    mime_type_ok = MIME_TYPES.include?(ftype) ? true : false
    if mime_type_ok
      @errorNumber = 0
    else
      @errorNumber = 202
      raise_mime_type_and_show_msg(ftype)
    end
    mime_type_ok
  end

  ##############################################################################
  # Raise and exception, log the msg error and show msg
  #
  def raise_mime_type_and_show_msg(ftype)
    msg = "#{ftype} is invalid MIME type"
    puts msg;
    raise msg;
    log msg
  end

  ##############################################################################
  # Copy tmp file to current_directory_path/tmp_file.original_filename
  #
  def copy_tmp_file(tmp_file)
    path = current_directory_path + "/" + tmp_file.original_filename
    File.open(path, "wb", 0664) do |fp|
      FileUtils.copy_stream(tmp_file, fp)
    end
  end

  ##############################################################################
  # Puts a messgae info in the current log, only if RAILS_ENV is 'development'
  #
  def log(str)
    RAILS_DEFAULT_LOGGER.info str if RAILS_ENV == 'development'
  end

  ##############################################################################
  # Puts some data in the current log
  #
  def log_upload
    log "FCKEDITOR - #{params[:NewFile]}"
    log "FCKEDITOR - UPLOAD_FOLDER: #{UPLOAD_FOLDER}"
    log "FCKEDITOR - #{File.expand_path(Rails.root)}/public#{UPLOAD_FOLDER}/" +
        "#{@new_file.original_filename}"
  end

  ##############################################################################
  # Returns the filesystem folder with the current folder
  #
  def current_directory_path
    base_dir = "#{UPLOADED_ROOT}/#{params[:Type]}"
    Dir.mkdir(base_dir,0775) unless File.exists?(base_dir)
    check_path("#{base_dir}#{params[:CurrentFolder]}")
  end

  ##############################################################################
  # Returns the upload url folder with the current folder
  #
  def upload_directory_path
    # => url_root = ActionController::Base.relative_url_root.to_s
    url_root = STRANGE_ROOTE.to_s
    uploaded = STRANGE_ROOTE + "#{UPLOAD_FOLDER}/#{params[:Type]}"
    "#{uploaded}#{params[:CurrentFolder]}"
  end

  ##############################################################################
  # Current uploaded file path
  #
  def uploaded_file_path
    "#{upload_directory_path}/#{@new_file.original_filename}"
  end

  ##############################################################################
  # check that the file is a tempfile object
  #
  def check_file(file)
    log "FCKEDITOR ---- CLASS OF UPLOAD OBJECT: #{file.class}"

    unless "#{file.class}" == "Tempfile" || "#{file.class}" == "StringIO"
      @errorNumber = 403
      throw Exception.new
    end
    file
  end

  def check_path(path)
    exp_path = File.expand_path path
    if exp_path !~ %r[^#{File.expand_path(Rails.root)}/public#{UPLOAD_FOLDER}]
      @errorNumber = 403
      throw Exception.new
    end
    path
  end
end
