class ProdukteController < ApplicationController
  
  def index
    @produkt_bereiche = ProduktBereich.all
    @title = 'Produkte'
    @activio = 'produkt_bereich'
    @sub_activio = 'produkt_bereich'
    @sub_sub_activio = 'produkt_bereich'
    @sidebar = true
    if Seite.find_by_name('produkte')
      @seite = Seite.find_by_name('produkte')
      if @seite && !@seite.sidebars.nil?
        @rightsides = @seite.sidebars
        @rightside = true if @rightsides.count > 0
      end
    end
   
    @banners = Banner.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produkt_bereiche }
    end
  end

  def show
    @activio = 'produkt_bereich'
    @sidebar = true
    @banners = Banner.all
    @sub_activio = params[:paramx]
    @sub_sub_activio = params[:paramy]
    if ProduktBereich.find_by_name(params[:name]).nil?
      @title = 'Produkte'
      @produkt_bereiche = ProduktBereich.all
        if Seite.find_by_name('produkte')
          @seite = Seite.find_by_name('produkte')
          if @seite && !@seite.sidebars.nil?
            @rightsides = @seite.sidebars
            @rightside = true if @rightsides.count > 0
          end
        end
    else
      @produkt_bereich = ProduktBereich.find_by_name(params[:name])
      @title = @produkt_bereich.titel.titleize+' . Produkte '
          
          if !params[:paramx].nil? && !params[:paramy].nil?
            unless ProduktKategorie.find_by_name(params[:paramx]).nil?
              @produkt_kategorie = ProduktKategorie.find_by_name(params[:paramx])
              @title += ' . '+@produkt_kategorie.titel
              unless Produkt.find_by_name(params[:paramy]).nil?
                @produkt = Produkt.find_by_name(params[:paramy])
                @title =  @produkt.titel.titleize + ' . ' + @title
              else
                @produkte = Produkt.all
              end
            else 
              @produkt_kategorien = ProduktKategorie.all
            end
          elsif !params[:paramx].nil?
            unless ProduktKategorie.find_by_name(params[:paramx]).nil?
              @produkt_kategorie = ProduktKategorie.find_by_name(params[:paramx])
              @title = @produkt_kategorie.titel.titleize + ' . ' + @title
            else 
              @produkt_kategorien = ProduktKategorie.all
            end
          elsif params[:paramx].nil? && params[:paramy].nil?
             if @produkt_bereich && @produkt_bereich.sidebars.count > 0
               @rightsides = @produkt_bereich.sidebars
               @rightside = true
              end
          end
     end
    
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.xml  { render :xml => @product }
    end
  end

end
