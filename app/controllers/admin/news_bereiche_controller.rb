class Admin::NewsBereicheController < ApplicationController
  before_filter :authorized_autor

  layout 'admin'
  
  def index
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_bereich'
    @sub_sub_activio = 'admin_news_bereich'
    @news_bereiche = NewsBereich.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_bereiche }
    end
  end

  def show
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_bereich'
    @sub_sub_activio = 'admin_news_bereich'
    @news_bereich = NewsBereich.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_bereich }
    end
  end

  def new
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_bereich'
    @sub_sub_activio = 'admin_news_bereich'
    @news_bereich = NewsBereich.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_bereich }
    end
  end

  def edit
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_bereich'
    @sub_sub_activio = 'admin_news_bereich'
    @news_bereich = NewsBereich.find(params[:id])
  end

  def create
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_bereich'
    @sub_sub_activio = 'admin_news_bereich'
    @news_bereich = NewsBereich.new(params[:news_bereich])
    respond_to do |format|
      if @news_bereich.save
        format.html { redirect_to(admin_news_bereiche_path, :notice => 'News Bereiche wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @news_bereich, :status => :created, :location => @news_bereich }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_bereich'
    @sub_sub_activio = 'admin_news_bereich'
    @news_bereich = NewsBereich.find(params[:id])

    respond_to do |format|
      if @news_bereich.update_attributes(params[:news_bereich])
        format.html { redirect_to(admin_news_bereiche_path, :notice => 'News Bereiche wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_bereich'
    @sub_sub_activio = 'admin_news_bereich'
    @news_bereich = NewsBereich.find(params[:id])
    @news_bereich.destroy
    respond_to do |format|
      format.html { redirect_to(admin_news_bereiche_path, :notice => 'News Bereiche wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



