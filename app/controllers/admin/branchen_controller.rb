class Admin::BranchenController < ApplicationController
  before_filter :authorized_autor

  layout 'admin'
  
  def index
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_branche'
    @sub_sub_activio = 'admin_branche'
    @branchen = Branche.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @branchen }
    end
  end

  def show
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_branche'
    @sub_sub_activio = 'admin_branche'
    @branche = Branche.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @branche }
    end
  end

  def new
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_branche'
    @sub_sub_activio = 'admin_branche'
    @branche = Branche.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @branche }
    end
  end

  def edit
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_branche'
    @sub_sub_activio = 'admin_branche'
    @branche = Branche.find(params[:id])
  end

  def create
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_branche'
    @sub_sub_activio = 'admin_branche'
    @branche = Branche.new(params[:branche])
    respond_to do |format|
      if @branche.save
        format.html { redirect_to(admin_branchen_path, :notice => 'Branchen wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @branche, :status => :created, :location => @branche }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @branche.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_branche'
    @sub_sub_activio = 'admin_branche'
    @branche = Branche.find(params[:id])

    respond_to do |format|
      if @branche.update_attributes(params[:branche])
        format.html { redirect_to(admin_branchen_path, :notice => 'Branchen wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @branche.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_portfolio_bereich'
    @sub_activio = 'admin_branche'
    @sub_sub_activio = 'admin_branche'
    @branche = Branche.find(params[:id])
    @branche.destroy
    respond_to do |format|
      format.html { redirect_to(admin_branchen_path, :notice => 'Branchen wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



