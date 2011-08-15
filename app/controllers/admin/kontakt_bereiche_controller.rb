class Admin::KontaktBereicheController < ApplicationController
  before_filter :authorized_autor

  layout 'admin'
  
  def index
    @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_bereich'
    @sub_sub_activio = 'admin_kontakt_bereich'
    @kontakt_bereiche = KontaktBereich.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kontakt_bereiche }
    end
  end

  def show
    @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_bereich'
    @sub_sub_activio = 'admin_kontakt_bereich'
    @kontakt_bereich = KontaktBereich.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kontakt_bereich }
    end
  end

  def new
    @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_bereich'
    @sub_sub_activio = 'admin_kontakt_bereich'
    @kontakt_bereich = KontaktBereich.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kontakt_bereich }
    end
  end

  def edit
    @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_bereich'
    @sub_sub_activio = 'admin_kontakt_bereich'
    @kontakt_bereich = KontaktBereich.find(params[:id])
  end

  def create
    @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_bereich'
    @sub_sub_activio = 'admin_kontakt_bereich'
    @kontakt_bereich = KontaktBereich.new(params[:kontakt_bereich])
    respond_to do |format|
      if @kontakt_bereich.save
        format.html { redirect_to(admin_kontakt_bereiche_path, :notice => 'Kontakt Bereiche wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @kontakt_bereich, :status => :created, :location => @kontakt_bereich }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kontakt_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_bereich'
    @sub_sub_activio = 'admin_kontakt_bereich'
    @kontakt_bereich = KontaktBereich.find(params[:id])

    respond_to do |format|
      if @kontakt_bereich.update_attributes(params[:kontakt_bereich])
        format.html { redirect_to(admin_kontakt_bereiche_path, :notice => 'Kontakt Bereiche wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kontakt_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_bereich'
    @sub_sub_activio = 'admin_kontakt_bereich'
    @kontakt_bereich = KontaktBereich.find(params[:id])
    @kontakt_bereich.destroy
    respond_to do |format|
      format.html { redirect_to(admin_kontakt_bereiche_path, :notice => 'Kontakt Bereiche wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



