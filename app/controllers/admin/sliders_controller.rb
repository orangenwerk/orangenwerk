class Admin::SlidersController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_slider'
    @sub_sub_activio = 'admin_slider'
    @sliders = Slider.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sliders }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_slider'
    @sub_sub_activio = 'admin_slider'
    @slider = Slider.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slider }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_slider'
    @sub_sub_activio = 'admin_slider'
    @slider = Slider.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slider }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_slider'
    @sub_sub_activio = 'admin_slider'
    @slider = Slider.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_slider'
    @sub_sub_activio = 'admin_slider'
    @slider = Slider.new(params[:slider])
    respond_to do |format|
      if @slider.save
        format.html { redirect_to(admin_sliders_path, :notice => 'Slider wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @slider, :status => :created, :location => @slider }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slider.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_slider'
    @sub_sub_activio = 'admin_slider'
    @slider = Slider.find(params[:id])

    respond_to do |format|
      if @slider.update_attributes(params[:slider])
        format.html { redirect_to(admin_sliders_path, :notice => 'Slider wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slider.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_slider'
    @sub_sub_activio = 'admin_slider'
    @slider = Slider.find(params[:id])
    @slider.destroy
    respond_to do |format|
      format.html { redirect_to(admin_sliders_path, :notice => 'Slider wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



