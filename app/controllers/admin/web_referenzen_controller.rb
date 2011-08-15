class Admin::WebReferenzenController < ApplicationController
  before_filter :authorized_autor
  
  layout 'admin'
  
  def index
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz'
    @web_referenzen = WebReferenz.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @web_referenzen }
    end
  end

  def show
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz'
    @web_referenz = WebReferenz.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @web_referenz }
    end
  end

  def new
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz'
    @web_referenz = WebReferenz.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @web_referenz }
    end
  end

  def edit
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz'
    @web_referenz = WebReferenz.find(params[:id])
  end

  def create
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz'
    @web_referenz = WebReferenz.new(params[:web_referenz])
    respond_to do |format|
      if @web_referenz.save
        format.html { redirect_to(admin_web_referenzen_path, :notice => 'Web Referenzen wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @web_referenz, :status => :created, :location => @web_referenz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @web_referenz.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz'
    @web_referenz = WebReferenz.find(params[:id])

    respond_to do |format|
      if @web_referenz.update_attributes(params[:web_referenz])
        format.html { redirect_to(admin_web_referenzen_path, :notice => 'Web Referenzen wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @web_referenz.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_web_referenz'
    @web_referenz = WebReferenz.find(params[:id])
    @web_referenz.destroy
    respond_to do |format|
      format.html { redirect_to(admin_web_referenzen_path, :notice => 'Web Referenzen wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



