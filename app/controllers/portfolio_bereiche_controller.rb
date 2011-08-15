class PortfolioBereicheController < ApplicationController
  
  def index
    @activio = 'portfolio'
    @sidebar = true
    @title = 'portfolio'
    @slider = Slider.all
    if Seite.find_by_name('portfolio')
      @seite = Seite.find_by_name('portfolio')
      if @seite && !@seite.sidebars.nil?
        @rightsides = @seite.sidebars
        @rightside = true if @rightsides.count > 0
      end
    end
  end

  def show
    @activio = 'portfolio'
    @sidebar = true
    @slider = Slider.all
    @title = 'portfolio'
    if %w[projekte kunden].include?(params[:name])
      @portfolio = PortfolioBereich.find_by_name(params[:name])
      if params[:name] == 'projekte'
        @title += ' . projekte'
        if params[:paramx]
          if ProduktBereich.find_by_name(params[:paramx])
            @produkt_bereich = ProduktBereich.find_by_name(params[:paramx])
              if Referenz.find_by_name(params[:paramy])
                @referenz = Referenz.find_by_name(params[:paramy])
              end
            @title += ' . '+@produkt_bereich.titel.downcase
            @referenzen = @produkt_bereich.referenzen
          end
        else
            @referenzen = Referenz.all
        end
      elsif params[:name] == 'kunden'
        @title += ' . kunden'
        if params[:paramx]
          if Branche.find_by_name(params[:paramx])
            @branche = Branche.find_by_name(params[:paramx])
            @title += ' . '+@branche.titel.downcase
            @kunden = @branche.kunden
          end
        else
            @kunden = Kunde.all
        end
      end
   
    else
      @portfolios = PortfolioBereich.all
      if Seite.find_by_name('portfolio')
      @seite = Seite.find_by_name('portfolio')
      if @seite && !@seite.sidebars.nil?
        @rightsides = @seite.sidebars
        @rightside = true if @rightsides.count > 0
      end
      end
    end
  end

end
