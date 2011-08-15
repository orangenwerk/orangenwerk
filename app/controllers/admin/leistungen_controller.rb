class Admin::LeistungenController < ApplicationController
  before_filter :authorized_autor
  before_filter :load_data
  
  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_leistung'
    @sub_sub_activio = 'admin_leistung'
    @leistungen = Leistung.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leistungen }
    end
  end

  def show
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_leistung'
    @sub_sub_activio = 'admin_leistung'
    @leistung = Leistung.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leistung }
    end
  end

  def new
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_leistung'
    @sub_sub_activio = 'admin_leistung'
    @leistung = Leistung.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leistung }
    end
  end

  def edit
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_leistung'
    @sub_sub_activio = 'admin_leistung'
    @leistung = Leistung.find(params[:id])
    @produkt_bereiche = @leistung.produkt_bereiche
  end

  def create
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_leistung'
    @sub_sub_activio = 'admin_leistung'
    @leistung = Leistung.new(params[:leistung])
    respond_to do |format|
      if @leistung.save
        format.html { redirect_to(edit_admin_leistung_path(@leistung), :notice => 'Leistungen wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @leistung, :status => :created, :location => @leistung }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @leistung.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_leistung'
    @sub_sub_activio = 'admin_leistung'
    @leistung = Leistung.find(params[:id])

    respond_to do |format|
      if @leistung.update_attributes(params[:leistung])
        format.html { redirect_to(admin_leistungen_path, :notice => 'Leistungen wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @leistung.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_leistung'
    @sub_sub_activio = 'admin_leistung'
    @leistung = Leistung.find(params[:id])
    @leistung.destroy
    respond_to do |format|
      format.html { redirect_to(admin_leistungen_path, :notice => 'Leistungen wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  
    # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def reorder
    params[:leistung].each_with_index do |id, index|
      LeistungenProdukt.update_all(['position=?', index+1], ['leistung_id=?', id])
    end
  end
  
  
  def selected
    @leistungen = @produkt.leistungen
    respond_to do |format|
      format.html { render 'index.html.erb' }
    end
  end
  
  def select
    @produkt = Produkt.find_by_id(params[:produkt_id])
    @leistung = Leistung.find(params[:id])
    @produkt.leistungen << @leistung
    @produkt.save
    @leistungen = @produkt.leistungen
    render :layout => false
  end
  
  def available

    @available_leistungen = Leistung.all
    @available_leistungen.delete_if { |leistung| @produkt.leistungen.include?(leistung) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end
  
  def remove
     @killa = LeistungenProdukt.where("leistung_id = ? AND produkt_id = ?", params[:id], params[:produkt_id])
    @killa.each do |kill|
      kill.destroy
    end
    @leistungen = @produkt.leistungen
    render_js_for_destroy
  end

  
  private
    
    def load_data
      if params[:produkt_id]
        @produkt = Produkt.find_by_id(params[:produkt_id])
      end
    end
    
    def render_js_for_destroy
      render :partial => "/admin_shared/destroy"
      flash.notice = nil
    end
  
end



