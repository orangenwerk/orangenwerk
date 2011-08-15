class Admin::NewsletterAbosController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_newsletter_abo'
    @sub_sub_activio = 'admin_newsletter_abo'
    @newsletter_abos = NewsletterAbo.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletter_abos }
    end
  end

  def show
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_newsletter_abo'
    @sub_sub_activio = 'admin_newsletter_abo'
    @newsletter_abo = NewsletterAbo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletter_abo }
    end
  end

  def new
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_newsletter_abo'
    @sub_sub_activio = 'admin_newsletter_abo'
    @newsletter_abo = NewsletterAbo.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletter_abo }
    end
  end

  def edit
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_newsletter_abo'
    @sub_sub_activio = 'admin_newsletter_abo'
    @newsletter_abo = NewsletterAbo.find(params[:id])
  end

  def create
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_newsletter_abo'
    @sub_sub_activio = 'admin_newsletter_abo'
    @newsletter_abo = NewsletterAbo.new(params[:newsletter_abo])
    respond_to do |format|
      if @newsletter_abo.save
        format.html { redirect_to(admin_newsletter_abos_path, :notice => 'Newsletter Abos wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @newsletter_abo, :status => :created, :location => @newsletter_abo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsletter_abo.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_newsletter_abo'
    @sub_sub_activio = 'admin_newsletter_abo'
    @newsletter_abo = NewsletterAbo.find(params[:id])

    respond_to do |format|
      if @newsletter_abo.update_attributes(params[:newsletter_abo])
        format.html { redirect_to(admin_newsletter_abos_path, :notice => 'Newsletter Abos wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletter_abo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_newsletter_abo'
    @sub_sub_activio = 'admin_newsletter_abo'
    @newsletter_abo = NewsletterAbo.find(params[:id])
    @newsletter_abo.destroy
    respond_to do |format|
      format.html { redirect_to(admin_newsletter_abos_path, :notice => 'Newsletter Abos wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



