class Admin::AgbsController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_agb'
    @sub_sub_activio = 'admin_agb'
    @agbs = Agb.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agbs }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_agb'
    @sub_sub_activio = 'admin_agb'
    @agb = Agb.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agb }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_agb'
    @sub_sub_activio = 'admin_agb'
    @agb = Agb.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agb }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_agb'
    @sub_sub_activio = 'admin_agb'
    @agb = Agb.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_agb'
    @sub_sub_activio = 'admin_agb'
    @agb = Agb.new(params[:agb])
    respond_to do |format|
      if @agb.save
        format.html { redirect_to(admin_agbs_path, :notice => 'AGBs wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @agb, :status => :created, :location => @agb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agb.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_agb'
    @sub_sub_activio = 'admin_agb'
    @agb = Agb.find(params[:id])

    respond_to do |format|
      if @agb.update_attributes(params[:agb])
        format.html { redirect_to(admin_agbs_path, :notice => 'AGBs wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agb.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_agb'
    @sub_sub_activio = 'admin_agb'
    @agb = Agb.find(params[:id])
    @agb.destroy
    respond_to do |format|
      format.html { redirect_to(admin_agbs_path, :notice => 'AGBs wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  
  def reorder
    params[:agb].each_with_index do |id, index|
      Agb.update_all(['position=?', index+1], ['id=?', id])
    end
  end
  
end



