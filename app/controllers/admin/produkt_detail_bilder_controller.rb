class Admin::ProduktDetailBilderController < ApplicationController
  before_filter :authorized_autor
  before_filter :load_data
  
  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_produkt_detail_bild'
    @sub_sub_activio = 'admin_produkt_detail_bild'
    @produkt_detail_bilder = ProduktDetailBild.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produkt_detail_bilder }
    end
  end

  def show
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_produkt_detail_bild'
    @sub_sub_activio = 'admin_produkt_detail_bild'
    @produkt_detail_bild = ProduktDetailBild.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produkt_detail_bild }
    end
  end

  def new
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_produkt_detail_bild'
    @sub_sub_activio = 'admin_produkt_detail_bild'
    @produkt_detail_bild = ProduktDetailBild.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produkt_detail_bild }
    end
  end

  def edit
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_produkt_detail_bild'
    @sub_sub_activio = 'admin_produkt_detail_bild'
    @produkt_detail_bild = ProduktDetailBild.find(params[:id])
  end

  def create
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_produkt_detail_bild'
    @sub_sub_activio = 'admin_produkt_detail_bild'
    @produkt_detail_bild = ProduktDetailBild.new(params[:produkt_detail_bild])
    respond_to do |format|
      if @produkt_detail_bild.save
        if @produkt
            format.html { redirect_to(selected_admin_produkt_produkt_detail_bilder_url(@produkt), :notice => 'Produkt Detail Bilder wurde erfolgreich erstellt.') }
        else
            format.html { redirect_to(admin_produkt_detail_bilder_path, :notice => 'Produkt Detail Bilder wurde erfolgreich erstellt.') }
            format.xml  { render :xml => @produkt_detail_bild, :status => :created, :location => @produkt_detail_bild }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produkt_detail_bild.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_produkt_detail_bild'
    @sub_sub_activio = 'admin_produkt_detail_bild'
    @produkt_detail_bild = ProduktDetailBild.find(params[:id])

    respond_to do |format|
      if @produkt_detail_bild.update_attributes(params[:produkt_detail_bild])
        if @produkt
            format.html { redirect_to(selected_admin_produkt_produkt_detail_bilder_url(@produkt), :notice => 'Produkt Detail Bilder wurde aktualisiert.') }
        else
          format.html { redirect_to(admin_produkt_detail_bilder_path, :notice => 'Produkt Detail Bilder wurde aktualisiert.') }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produkt_detail_bild.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_produkt_bereich'
    @sub_activio = 'admin_produkt_detail_bild'
    @sub_sub_activio = 'admin_produkt_detail_bild'
    @produkt_detail_bild = ProduktDetailBild.find(params[:id])
    @produkt_detail_bild.destroy
    respond_to do |format|
      format.html { redirect_to(admin_produkt_detail_bilder_path, :notice => 'Produkt Detail Bilder wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def selected
    @produkt_detail_bilder = @produkt.produkt_detail_bilder
    respond_to do |format|
      format.html { render 'index.html.erb' }
    end
  end
  
  private
    
    def load_data
      if params[:produkt_id]
        @produkt = Produkt.find_by_id(params[:produkt_id])
      end
    end
  
end



