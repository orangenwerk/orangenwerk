class Admin::SidebarsController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_sidebar'
    @sidebars = Sidebar.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sidebars }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_sidebar'
    @sidebar = Sidebar.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sidebar }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_sidebar'
    @sidebar = Sidebar.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sidebar }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_sidebar'
    @sidebar = Sidebar.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_sidebar'
    @sidebar = Sidebar.new(params[:sidebar])
    respond_to do |format|
      if @sidebar.save
        format.html { redirect_to(admin_sidebars_path, :notice => 'Sidebar wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @sidebar, :status => :created, :location => @sidebar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sidebar.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_sidebar'
    @sidebar = Sidebar.find(params[:id])

    respond_to do |format|
      if @sidebar.update_attributes(params[:sidebar])
        format.html { redirect_to(admin_sidebars_path, :notice => 'Sidebar wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sidebar.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_sidebar'
    @sidebar = Sidebar.find(params[:id])
    @sidebar.destroy
    respond_to do |format|
      format.html { redirect_to(admin_sidebars_path, :notice => 'Sidebar wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end


