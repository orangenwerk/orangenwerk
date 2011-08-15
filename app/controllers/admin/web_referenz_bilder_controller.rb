class Admin::WebReferenzBilderController < ApplicationController
  before_filter :authorized_autor
  
  before_filter :load_data

  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz_bild'
    
    if @web_referenz
      @web_referenz_bilder = @web_referenz.web_referenz_bilder
    else
      @web_referenz_bilder = WebReferenzBild.order(sort_column + ' ' + sort_direction)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @web_referenz_bilder }
    end
  end

  def show
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz_bild'
    @web_referenz_bild = WebReferenzBild.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @web_referenz_bild }
    end
  end

  def new
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz_bild'
    @web_referenz_bild = WebReferenzBild.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @web_referenz_bild }
    end
  end

  def edit
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz_bild'
    @web_referenz_bild = WebReferenzBild.find(params[:id])
  end

  def create
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz_bild'
    @web_referenz_bild = WebReferenzBild.new(params[:web_referenz_bild])
    respond_to do |format|
      if @web_referenz_bild.save
        format.html { redirect_to(admin_web_referenz_bilder_path, :notice => 'Web Referenz Bilder wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @web_referenz_bild, :status => :created, :location => @web_referenz_bild }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @web_referenz_bild.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz_bild'
    @web_referenz_bild = WebReferenzBild.find(params[:id])

    respond_to do |format|
      if @web_referenz_bild.update_attributes(params[:web_referenz_bild])
        format.html { redirect_to(admin_web_referenz_bilder_path, :notice => 'Web Referenz Bilder wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @web_referenz_bild.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz_bild'
    @web_referenz_bild = WebReferenzBild.find(params[:id])
    @web_referenz_bild.destroy
    respond_to do |format|
      format.html { redirect_to(admin_web_referenz_bilder_path, :notice => 'Web Referenz Bilder wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  private

     def load_data
       if params[:web_referenz_id]
         @web_referenz = WebReferenz.find_by_id(params[:web_referenz_id])
       end
     end
  
end



