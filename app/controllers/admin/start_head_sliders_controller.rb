class Admin::StartHeadSlidersController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_start_head_slider'
    @sub_sub_activio = 'admin_start_head_slider'
    @start_head_sliders = StartHeadSlider.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @start_head_sliders }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_start_head_slider'
    @sub_sub_activio = 'admin_start_head_slider'
    @start_head_slider = StartHeadSlider.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @start_head_slider }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_start_head_slider'
    @sub_sub_activio = 'admin_start_head_slider'
    @start_head_slider = StartHeadSlider.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @start_head_slider }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_start_head_slider'
    @sub_sub_activio = 'admin_start_head_slider'
    @start_head_slider = StartHeadSlider.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_start_head_slider'
    @sub_sub_activio = 'admin_start_head_slider'
    @start_head_slider = StartHeadSlider.new(params[:start_head_slider])
    respond_to do |format|
      if @start_head_slider.save
        format.html { redirect_to(admin_start_head_sliders_path, :notice => 'HeadTabSlider wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @start_head_slider, :status => :created, :location => @start_head_slider }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @start_head_slider.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_start_head_slider'
    @sub_sub_activio = 'admin_start_head_slider'
    @start_head_slider = StartHeadSlider.find(params[:id])

    respond_to do |format|
      if @start_head_slider.update_attributes(params[:start_head_slider])
        format.html { redirect_to(admin_start_head_sliders_path, :notice => 'HeadTabSlider wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @start_head_slider.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_start_head_slider'
    @sub_sub_activio = 'admin_start_head_slider'
    @start_head_slider = StartHeadSlider.find(params[:id])
    @start_head_slider.destroy
    respond_to do |format|
      format.html { redirect_to(admin_start_head_sliders_path, :notice => 'HeadTabSlider wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end


