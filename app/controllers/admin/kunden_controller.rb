class Admin::KundenController < ApplicationController
  before_filter :authorized_autor

  layout 'admin'
  
  def index
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_kunde'
    @sub_sub_activio = 'admin_kunde'
    @kunden = Kunde.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kunden }
    end
  end

  def show
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_kunde'
    @sub_sub_activio = 'admin_kunde'
    @kunde = Kunde.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kunde }
    end
  end

  def new
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_kunde'
    @sub_sub_activio = 'admin_kunde'
    @kunde = Kunde.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kunde }
    end
  end

  def edit
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_kunde'
    @sub_sub_activio = 'admin_kunde'
    @kunde = Kunde.find(params[:id])
  end

  def create
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_kunde'
    @sub_sub_activio = 'admin_kunde'
    @kunde = Kunde.new(params[:kunde])
    respond_to do |format|
      if @kunde.save
        format.html { redirect_to(admin_kunden_path, :notice => 'Kunden wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @kunde, :status => :created, :location => @kunde }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kunde.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_kunde'
    @sub_sub_activio = 'admin_kunde'
    @kunde = Kunde.find(params[:id])

    respond_to do |format|
      if @kunde.update_attributes(params[:kunde])
        format.html { redirect_to(admin_kunden_path, :notice => 'Kunden wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kunde.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_kunde'
    @sub_sub_activio = 'admin_kunde'
    @kunde = Kunde.find(params[:id])
    @kunde.destroy
    respond_to do |format|
      format.html { redirect_to(admin_kunden_path, :notice => 'Kunden wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



