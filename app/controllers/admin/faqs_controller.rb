class Admin::FaqsController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_faq'
    @sub_sub_activio = 'admin_faq'
    @faqs = Faq.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @faqs }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_faq'
    @sub_sub_activio = 'admin_faq'
    @faq = Faq.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @faq }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_faq'
    @sub_sub_activio = 'admin_faq'
    @faq = Faq.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @faq }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_faq'
    @sub_sub_activio = 'admin_faq'
    @faq = Faq.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_faq'
    @sub_sub_activio = 'admin_faq'
    @faq = Faq.new(params[:faq])
    respond_to do |format|
      if @faq.save
        format.html { redirect_to(admin_faqs_path, :notice => 'FAQs wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @faq, :status => :created, :location => @faq }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_faq'
    @sub_sub_activio = 'admin_faq'
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        format.html { redirect_to(admin_faqs_path, :notice => 'FAQs wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_faq'
    @sub_sub_activio = 'admin_faq'
    @faq = Faq.find(params[:id])
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to(admin_faqs_path, :notice => 'FAQs wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



