class Admin::KundenMeinungenController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_kunden_meinung'
    @sub_sub_activio = 'admin_kunden_meinung'
    @kunden_meinungen = KundenMeinung.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kunden_meinungen }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_kunden_meinung'
    @sub_sub_activio = 'admin_kunden_meinung'
    @kunden_meinung = KundenMeinung.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kunden_meinung }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_kunden_meinung'
    @sub_sub_activio = 'admin_kunden_meinung'
    @kunden_meinung = KundenMeinung.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kunden_meinung }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_kunden_meinung'
    @sub_sub_activio = 'admin_kunden_meinung'
    @kunden_meinung = KundenMeinung.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_kunden_meinung'
    @sub_sub_activio = 'admin_kunden_meinung'
    @kunden_meinung = KundenMeinung.new(params[:kunden_meinung])
    respond_to do |format|
      if @kunden_meinung.save
        format.html { redirect_to(admin_kunden_meinungen_path, :notice => 'Kunden Meinungen wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @kunden_meinung, :status => :created, :location => @kunden_meinung }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kunden_meinung.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_kunden_meinung'
    @sub_sub_activio = 'admin_kunden_meinung'
    @kunden_meinung = KundenMeinung.find(params[:id])

    respond_to do |format|
      if @kunden_meinung.update_attributes(params[:kunden_meinung])
        format.html { redirect_to(admin_kunden_meinungen_path, :notice => 'Kunden Meinungen wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kunden_meinung.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_kunden_meinung'
    @sub_sub_activio = 'admin_kunden_meinung'
    @kunden_meinung = KundenMeinung.find(params[:id])
    @kunden_meinung.destroy
    respond_to do |format|
      format.html { redirect_to(admin_kunden_meinungen_path, :notice => 'Kunden Meinungen wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



