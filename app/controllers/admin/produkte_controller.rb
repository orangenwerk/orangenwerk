class Admin::ProdukteController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_autor

  before_filter :load_data

  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt'
    @sub_sub_activio = 'sub_sub_admin_produkt'
    
    if @referenz
      @produkte = @referenz.produkte
    else
      @produkte = Produkt.order(sort_column + ' ' + sort_direction)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produkte }
    end
  end

  def show
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt'
    @sub_sub_activio = 'sub_sub_admin_produkt'
    @produkt = Produkt.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produkt }
    end
  end

  def new
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt'
    @sub_sub_activio = 'sub_sub_admin_produkt'
    @produkt = Produkt.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produkt }
    end
  end

  def edit
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt'
    @sub_sub_activio = 'sub_sub_admin_produkt'
    @produkt = Produkt.find(params[:id])
  end

  def create
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt'
    @sub_sub_activio = 'sub_sub_admin_produkt'
    @produkt = Produkt.new(params[:produkt])
    respond_to do |format|
      if @produkt.save
        format.html { redirect_to(edit_admin_produkt_path(@produkt), :notice => 'Produkt wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @produkt, :status => :created, :location => @produkt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produkt.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt'
    @sub_sub_activio = 'sub_sub_admin_produkt'
    @produkt = Produkt.find(params[:id])

    respond_to do |format|
      if @produkt.update_attributes(params[:produkt])
        format.html { redirect_to(admin_produkte_path, :notice => 'Produkt wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produkt.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @activio = 'admin_produkt_bereich'
    @sub_activio = 'sub_admin_produkt'
    @sub_sub_activio = 'sub_sub_admin_produkt'
    @produkt = Produkt.find(params[:id])
    @produkt.destroy
    respond_to do |format|
      format.html { redirect_to(admin_produkte_path, :notice => 'Produkt wurde geloescht.') }
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



