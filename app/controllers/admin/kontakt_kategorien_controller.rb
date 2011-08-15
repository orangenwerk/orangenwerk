class Admin::KontaktKategorienController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_kategorie'
    @sub_sub_activio = 'admin_kontakt_kategorie'
    @kontakt_kategorien = KontaktKategorie.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kontakt_kategorien }
    end
  end

  def show
        @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_kategorie'
    @sub_sub_activio = 'admin_kontakt_kategorie'
    @kontakt_kategorie = KontaktKategorie.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kontakt_kategorie }
    end
  end

  def new
        @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_kategorie'
    @sub_sub_activio = 'admin_kontakt_kategorie'
    @kontakt_kategorie = KontaktKategorie.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kontakt_kategorie }
    end
  end

  def edit
        @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_kategorie'
    @sub_sub_activio = 'admin_kontakt_kategorie'
    @kontakt_kategorie = KontaktKategorie.find(params[:id])
  end

  def create
        @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_kategorie'
    @sub_sub_activio = 'admin_kontakt_kategorie'
    @kontakt_kategorie = KontaktKategorie.new(params[:kontakt_kategorie])
    respond_to do |format|
      if @kontakt_kategorie.save
        format.html { redirect_to(admin_kontakt_kategorien_path, :notice => 'Kontakt Kategorien wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @kontakt_kategorie, :status => :created, :location => @kontakt_kategorie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kontakt_kategorie.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_kategorie'
    @sub_sub_activio = 'admin_kontakt_kategorie'
    @kontakt_kategorie = KontaktKategorie.find(params[:id])

    respond_to do |format|
      if @kontakt_kategorie.update_attributes(params[:kontakt_kategorie])
        format.html { redirect_to(admin_kontakt_kategorien_path, :notice => 'Kontakt Kategorien wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kontakt_kategorie.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_kontakt_bereich'
    @sub_activio = 'admin_kontakt_kategorie'
    @sub_sub_activio = 'admin_kontakt_kategorie'
    @kontakt_kategorie = KontaktKategorie.find(params[:id])
    @kontakt_kategorie.destroy
    respond_to do |format|
      format.html { redirect_to(admin_kontakt_kategorien_path, :notice => 'Kontakt Kategorien wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



