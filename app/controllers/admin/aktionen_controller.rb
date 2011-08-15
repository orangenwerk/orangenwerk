class Admin::AktionenController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_aktion'
    @aktionen = Aktion.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aktionen }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_aktion'
    @aktion = Aktion.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aktion }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_aktion'
    @aktion = Aktion.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aktion }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_aktion'
    @aktion = Aktion.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_aktion'
    @aktion = Aktion.new(params[:aktion])
    respond_to do |format|
      if @aktion.save
        format.html { redirect_to(admin_aktionen_path, :notice => 'Aktionen wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @aktion, :status => :created, :location => @aktion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aktion.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_aktion'
    @aktion = Aktion.find(params[:id])

    respond_to do |format|
      if @aktion.update_attributes(params[:aktion])
        format.html { redirect_to(admin_aktionen_path, :notice => 'Aktionen wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aktion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_sidebar'
    @sub_sub_activio = 'admin_aktion'
    @aktion = Aktion.find(params[:id])
    @aktion.destroy
    respond_to do |format|
      format.html { redirect_to(admin_aktionen_path, :notice => 'Aktionen wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



