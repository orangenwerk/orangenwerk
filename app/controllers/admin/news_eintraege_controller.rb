class Admin::NewsEintraegeController < ApplicationController
  before_filter :authorized_autor

  layout 'admin'
  
  def index
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_eintrag'
    @sub_sub_activio = 'admin_news_eintrag'
    @news_eintraege = NewsEintrag.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_eintraege }
    end
  end

  def show
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_eintrag'
    @sub_sub_activio = 'admin_news_eintrag'
    @news_eintrag = NewsEintrag.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_eintrag }
    end
  end

  def new
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_eintrag'
    @sub_sub_activio = 'admin_news_eintrag'
    @news_eintrag = NewsEintrag.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_eintrag }
    end
  end

  def edit
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_eintrag'
    @sub_sub_activio = 'admin_news_eintrag'
    @news_eintrag = NewsEintrag.find(params[:id])
  end

  def create
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_eintrag'
    @sub_sub_activio = 'admin_news_eintrag'
    @news_eintrag = NewsEintrag.new(params[:news_eintrag])
    respond_to do |format|
      if @news_eintrag.save
        format.html { redirect_to(admin_news_eintraege_path, :notice => 'News-Eintrag wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @news_eintrag, :status => :created, :location => @news_eintrag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_eintrag.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_eintrag'
    @sub_sub_activio = 'admin_news_eintrag'
    @news_eintrag = NewsEintrag.find(params[:id])

    respond_to do |format|
      if @news_eintrag.update_attributes(params[:news_eintrag])
        format.html { redirect_to(admin_news_eintraege_path, :notice => 'News-Eintrag wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_eintrag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_news_bereich'
    @sub_activio = 'admin_news_eintrag'
    @sub_sub_activio = 'admin_news_eintrag'
    @news_eintrag = NewsEintrag.find(params[:id])
    @news_eintrag.destroy
    respond_to do |format|
      format.html { redirect_to(admin_news_eintraege_path, :notice => 'News-Eintrag wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



