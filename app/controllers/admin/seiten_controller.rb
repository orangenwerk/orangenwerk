class Admin::SeitenController < ApplicationController
  before_filter :authorized_autor
  before_filter :authorized_master, :only => :destroy
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_seite'
    @sub_sub_activio = 'admin_seite'
    @seiten = Seite.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seiten }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_seite'
    @sub_sub_activio = 'admin_seite'
    @seite = Seite.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seite }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_seite'
    @sub_sub_activio = 'admin_seite'
    @seite = Seite.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seite }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_seite'
    @sub_sub_activio = 'admin_seite'
    @seite = Seite.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_seite'
    @sub_sub_activio = 'admin_seite'
    @seite = Seite.new(params[:seite])
    respond_to do |format|
      if @seite.save
        format.html { redirect_to(admin_seiten_path, :notice => 'Seite wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @seite, :status => :created, :location => @seite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_seite'
    @sub_sub_activio = 'admin_seite'
    @seite = Seite.find(params[:id])

    respond_to do |format|
      if @seite.update_attributes(params[:seite])
        format.html { redirect_to(admin_seiten_path, :notice => 'Seite wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_seite'
    @sub_sub_activio = 'admin_seite'
    @seite = Seite.find(params[:id])
    @seite.destroy
    respond_to do |format|
      format.html { redirect_to(admin_seiten_path, :notice => 'Seite wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end


