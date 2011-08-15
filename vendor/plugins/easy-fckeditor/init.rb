# Include hook code here
require 'fckeditor'
require 'fckeditor_version'
require 'fckeditor_file_utils'

FckeditorFileUtils.check_and_install


Rails.application.class.class_eval do
  config.load_paths += %W(#{Fckeditor::PLUGIN_CONTROLLER_PATH} #{Fckeditor::PLUGIN_HELPER_PATH})
end


# Rails::Initializer.run(:set_load_path, config)

ActionView::Base.send(:include, Fckeditor::Helper)

# require the controller
require 'fckeditor_controller'