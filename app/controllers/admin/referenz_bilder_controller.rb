class Admin::ReferenzBilderController < ApplicationController
  before_filter :authorized_autor
  before_filter :load_data

  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz_bild_bild'
    
    if @referenz
      @referenz_bilder = @referenz.referenz_bilder
    else
      @referenz_bilder = ReferenzBild.order(sort_column + ' ' + sort_direction)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @referenz_bilder }
    end
  end

  def show
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz_bild_bild'
    @referenz_bild = ReferenzBild.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @referenz_bild }
    end
  end

  def new
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz_bild_bild'
    @referenz_bild = ReferenzBild.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @referenz_bild }
    end
  end

  def edit
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz_bild_bild'
    @referenz_bild = ReferenzBild.find(params[:id])
  end

  def create
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz_bild_bild'
    @referenz_bild = ReferenzBild.new(params[:referenz_bild])
    respond_to do |format|
      if @referenz_bild.save
        format.html { redirect_to(admin_referenz_bilder_path, :notice => 'Referenz Bilder wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @referenz_bild, :status => :created, :location => @referenz_bild }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @referenz_bild.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz_bild_bild'
    @referenz_bild = ReferenzBild.find(params[:id])

    respond_to do |format|
      if @referenz_bild.update_attributes(params[:referenz_bild])
        format.html { redirect_to(admin_referenz_bilder_path, :notice => 'Referenz Bilder wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @referenz_bild.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz_bild_bild'
    @referenz_bild = ReferenzBild.find(params[:id])
    @referenz_bild.destroy
    respond_to do |format|
      format.html { redirect_to(admin_referenz_bilder_path, :notice => 'Referenz Bilder wurde geloescht.') }
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



