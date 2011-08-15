class Admin::BannersController < ApplicationController
  before_filter :authorized_autor
  before_filter :load_data
  
  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_banner'
    @sub_sub_activio = 'admin_banner'
    @banners = Banner.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banners }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_banner'
    @sub_sub_activio = 'admin_banner'
    @banner = Banner.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banner }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_banner'
    @sub_sub_activio = 'admin_banner'
    @banner = Banner.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banner }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_banner'
    @sub_sub_activio = 'admin_banner'
    @banner = Banner.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_banner'
    @sub_sub_activio = 'admin_banner'
    @banner = Banner.new(params[:banner])
    respond_to do |format|
      if @banner.save
        format.html { redirect_to(admin_banners_path, :notice => 'Banner wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @banner, :status => :created, :location => @banner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_banner'
    @sub_sub_activio = 'admin_banner'
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to(admin_banners_path, :notice => 'Banner wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_banner'
    @sub_sub_activio = 'admin_banner'
    @banner = Banner.find(params[:id])
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to(admin_banners_path, :notice => 'Banner wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  def selected
    @banners = @produkt.banners
    respond_to do |format|
      format.html { render 'index.html.erb' }
    end
  end

  def available
    @available_banners = Banner.all
    @available_banners.delete_if { |banner| @produkt.banners.include?(banner) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end

  def remove
    @killa = BannersProdukt.where("banner_id = ? AND produkt_id = ?", params[:id], params[:produkt_id])
    @killa.each do |kill|
      kill.destroy
    end
    @banners = @produkt.banners
    render_js_for_destroy
  end

  def select
    @produkt = Produkt.find_by_id(params[:produkt_id])
    @banner = Banner.find(params[:id])
    @produkt.banners << @banner
    @produkt.save
    @banners = @produkt.banners
    render :layout => false
  end
  
  
  private
    
    def load_data
      if params[:produkt_id]
        @produkt = Produkt.find_by_id(params[:produkt_id])
      end
    end
    
    def render_js_for_destroy
      render :partial => "/admin_shared/destroy"
      flash.notice = nil
    end
  
end



