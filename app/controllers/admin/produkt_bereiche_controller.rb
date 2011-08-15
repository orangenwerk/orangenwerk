class Admin::ProduktBereicheController < ApplicationController
  before_filter :authorized_autor
  before_filter :authorized_master, :only => :destroy
  before_filter :load_data

  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_bereich'
    @sub_sub_activio = 'sub_sub_admin_produkt_bereich'
    if @referenz
      @produkt_bereiche = @referenz.produkt_bereiche
    else
      @produkt_bereiche = ProduktBereich.order(sort_column + ' ' + sort_direction)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produkt_bereiche }
    end
  end

  def show
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_bereich'
    @sub_sub_activio = 'sub_sub_admin_produkt_bereich'
    @produkt_bereich = ProduktBereich.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produkt_bereich }
    end
  end

  def new
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_bereich'
    @sub_sub_activio = 'sub_sub_admin_produkt_bereich'
    @produkt_bereich = ProduktBereich.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produkt_bereich }
    end
  end

  def edit
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_bereich'
    @sub_sub_activio = 'sub_sub_admin_produkt_bereich'
    @produkt_bereich = ProduktBereich.find(params[:id])
  end

  def create
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_bereich'
    @sub_sub_activio = 'sub_sub_admin_produkt_bereich'
    @produkt_bereich = ProduktBereich.new(params[:produkt_bereich])
    respond_to do |format|
      if @produkt_bereich.save
        format.html { redirect_to(edit_admin_produkt_bereich_path(@produkt_bereich), :notice => 'Produkt-Bereich wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @produkt_bereich, :status => :created, :location => @produkt_bereich }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produkt_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_bereich'
    @sub_sub_activio = 'sub_sub_admin_produkt_bereich'
    @produkt_bereich = ProduktBereich.find(params[:id])

    respond_to do |format|
      if @produkt_bereich.update_attributes(params[:produkt_bereich])
        format.html { redirect_to(admin_produkt_bereiche_path, :notice => 'Produkt-Bereich wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produkt_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt_bereich'
    @sub_sub_activio = 'sub_sub_admin_produkt_bereich'
    @produkt_bereich = ProduktBereich.find(params[:id])
    @produkt_bereich.destroy
    respond_to do |format|
      format.html { redirect_to(admin_produkt_bereiche_path, :notice => 'Produkt-Bereich wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def selected
    if @leistung
      @produkt_bereiche = @leistung.produkt_bereiche
    elsif @referenz
      @produkt_bereiche = @referenz.produkt_bereiche
    end
    respond_to do |format|
      format.html { render 'index.html.erb' }
    end
  end
  
  def select
    if @leistung
      @leistung = Leistung.find_by_id(params[:leistung_id])
      @produkt_bereich = ProduktBereich.find(params[:id])
      @leistung.produkt_bereiche << @produkt_bereich
      @leistung.save
      @produkt_bereiche = @leistung.produkt_bereiche
      render :layout => false
    elsif @referenz
      @referenz = Leistung.find_by_id(params[:referenz_id])
      @produkt_bereich = ProduktBereich.find(params[:id])
      @referenz.produkt_bereiche << @produkt_bereich
      @referenz.save
      @produkt_bereiche = @referenz.produkt_bereiche
      render :layout => false
    end
  end
  
  def available

    @available_pbs = ProduktBereich.all
    if @leistung
      @available_pbs.delete_if { |pb| @leistung.produkt_bereiche.include?(pb) }
    elsif @referenz
      @available_pbs.delete_if { |pb| @referenz.produkt_bereiche.include?(pb) }
    end
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end

  
  
  
  def remove
    if params[:leistung_id]
      @killa = LeistungenProduktBereich.where("produkt_bereich_id = ? AND leistung_id = ?", params[:id], params[:leistung_id])
    elsif params[:referenz_id]
      @killa = ProduktBereicheReferenz.where("produkt_bereich_id = ? AND referenz_id = ?", params[:id], params[:referenz_id])
    end
    
    @killa.each do |kill|
      kill.destroy
    end
    
    if params[:leistung_id]
      @produkt_bereiche = @leistung.produkt_bereiche
    elsif params[:referenz_id]
      @produkt_bereiche = @referenz.produkt_bereiche
    end
    render_js_for_destroy
  end

  
  private
    
    def load_data
      if params[:leistung_id]
        @leistung = Leistung.find_by_id(params[:leistung_id])
      end
      if params[:referenz_id]
        @referenz = Referenz.find_by_id(params[:referenz_id])
      end
    end
    
  def render_js_for_destroy
    render :partial => "/admin_shared/destroy"
    flash.notice = nil
  end
  
end



