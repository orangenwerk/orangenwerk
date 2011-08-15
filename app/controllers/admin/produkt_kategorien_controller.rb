class Admin::ProduktKategorienController < ApplicationController
  before_filter :authorized_autor
  before_filter :authorized_admin, :only => :destroy

  before_filter :load_data

  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_kategorie'
    @sub_sub_activio = 'sub_sub_admin_produkt_kategorie'
    if @referenz
      @produkt_kategorien = @referenz.produkt_kategorien
    else
      @produkt_kategorien = ProduktKategorie.order(sort_column + ' ' + sort_direction)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produkt_kategorien }
    end
  end

  def show
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_kategorie'
    @sub_sub_activio = 'sub_sub_admin_produkt_kategorie'
    @produkt_kategorie = ProduktKategorie.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produkt_kategorie }
    end
  end

  def new
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_kategorie'
    @sub_sub_activio = 'sub_sub_admin_produkt_kategorie'
    @produkt_kategorie = ProduktKategorie.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produkt_kategorie }
    end
  end

  def edit
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_kategorie'
    @sub_sub_activio = 'sub_sub_admin_produkt_kategorie'
    @produkt_kategorie = ProduktKategorie.find(params[:id])
  end

  def create
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_kategorie'
    @sub_sub_activio = 'sub_sub_admin_produkt_kategorie'
    @produkt_kategorie = ProduktKategorie.new(params[:produkt_kategorie])
    respond_to do |format|
      if @produkt_kategorie.save
        format.html { redirect_to(admin_produkt_kategorien_path, :notice => 'Produkt Kategorien wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @produkt_kategorie, :status => :created, :location => @produkt_kategorie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produkt_kategorie.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_kategorie'
    @sub_sub_activio = 'sub_sub_admin_produkt_kategorie'
    @produkt_kategorie = ProduktKategorie.find(params[:id])

    respond_to do |format|
      if @produkt_kategorie.update_attributes(params[:produkt_kategorie])
        format.html { redirect_to(admin_produkt_kategorien_path, :notice => 'Produkt Kategorien wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produkt_kategorie.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_kategorie'
    @sub_sub_activio = 'sub_sub_admin_produkt_kategorie'
    @produkt_kategorie = ProduktKategorie.find(params[:id])
    @produkt_kategorie.destroy
    respond_to do |format|
      format.html { redirect_to(admin_produkt_kategorien_path, :notice => 'Produkt Kategorien wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  private

     def load_data
       if params[:referenz_id]
         @referenz = Referenz.find_by_id(params[:referenz_id])
       end
     end
  
end



