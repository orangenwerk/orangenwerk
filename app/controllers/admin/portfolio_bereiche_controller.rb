class Admin::PortfolioBereicheController < ApplicationController
  before_filter :authorized_autor

  layout 'admin'
  
  def index
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_portfolio_bereich'
    @sub_sub_activio = 'admin_portfolio_bereich'
    @portfolio_bereiche = PortfolioBereich.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @portfolio_bereiche }
    end
  end

  def show
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_portfolio_bereich'
    @sub_sub_activio = 'admin_portfolio_bereich'
    @portfolio_bereich = PortfolioBereich.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @portfolio_bereich }
    end
  end

  def new
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_portfolio_bereich'
    @sub_sub_activio = 'admin_portfolio_bereich'
    @portfolio_bereich = PortfolioBereich.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @portfolio_bereich }
    end
  end

  def edit
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_portfolio_bereich'
    @sub_sub_activio = 'admin_portfolio_bereich'
    @portfolio_bereich = PortfolioBereich.find(params[:id])
  end

  def create
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_portfolio_bereich'
    @sub_sub_activio = 'admin_portfolio_bereich'
    @portfolio_bereich = PortfolioBereich.new(params[:portfolio_bereich])
    respond_to do |format|
      if @portfolio_bereich.save
        format.html { redirect_to(admin_portfolio_bereiche_path, :notice => 'Portfolio Bereiche wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @portfolio_bereich, :status => :created, :location => @portfolio_bereich }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @portfolio_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_portfolio_bereich'
    @sub_sub_activio = 'admin_portfolio_bereich'
    @portfolio_bereich = PortfolioBereich.find(params[:id])

    respond_to do |format|
      if @portfolio_bereich.update_attributes(params[:portfolio_bereich])
        format.html { redirect_to(admin_portfolio_bereiche_path, :notice => 'Portfolio Bereiche wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @portfolio_bereich.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_portfolio_bereich'
    @sub_sub_activio = 'admin_portfolio_bereich'
    @portfolio_bereich = PortfolioBereich.find(params[:id])
    @portfolio_bereich.destroy
    respond_to do |format|
      format.html { redirect_to(admin_portfolio_bereiche_path, :notice => 'Portfolio Bereiche wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



