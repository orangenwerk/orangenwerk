class Admin::ReferenzenController < ApplicationController
  before_filter :authorized_autor
  before_filter :load_data

  layout proc { |controller| controller.request.xhr? ? false : 'admin' }
  
  def index
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz'
    @referenzen = Referenz.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @referenzen }
    end
  end

  def show
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz'
    @referenz = Referenz.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @referenz }
    end
  end

  def new
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz'
    @referenz = Referenz.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @referenz }
    end
  end

  def edit
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz'
    @referenz = Referenz.find(params[:id])
  end

  def create
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz'
    @referenz = Referenz.new(params[:referenz])
    respond_to do |format|
      if @referenz.save
        format.html { redirect_to(admin_referenzen_path, :notice => 'Referenzen wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @referenz, :status => :created, :location => @referenz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @referenz.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz'
    @referenz = Referenz.find(params[:id])

    respond_to do |format|
      if @referenz.update_attributes(params[:referenz])
        format.html { redirect_to(admin_referenzen_path, :notice => 'Referenzen wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @referenz.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_referenz'
    @sub_sub_activio = 'admin_referenz'
    @referenz = Referenz.find(params[:id])
    @referenz.destroy
    respond_to do |format|
      format.html { redirect_to(admin_referenzen_path, :notice => 'Referenzen wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def selected
    @referenzen = @produkt.referenzen
    respond_to do |format|
      format.html { render 'index.html.erb' }
    end
  end
  
  def select
    @produkt = Produkt.find(params[:produkt_id])
    @referenz = Referenz.find(params[:id])
    @produkt.referenzen << @referenz
    @produkt.save
    @referenzen = @produkt.referenzen
    render :layout => false
  end
  
  def available
    @available_refs = Referenz.all
    @available_refs.delete_if { |ref| @produkt.referenzen.include?(ref) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end
  def remove
    @killa = ProdukteReferenz.where("referenz_id = ? AND produkt_id = ?", params[:id], params[:produkt_id])
    @killa.each do |kill|
      kill.destroy
    end
    @referenzen = @produkt.referenzen
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



