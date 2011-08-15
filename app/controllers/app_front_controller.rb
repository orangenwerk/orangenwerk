class AppFrontController < ApplicationController
  
  
  def start
    @title = 'Agentur für visuelle Medien'
    @activio = 'home'
    @slider = Slider.all
    if Seite.find_by_name('home')
      @seite = Seite.find_by_name('home')
    end
  end
  
  def lightbox
    @referenz = Referenz.find(params[:id])
    render :partial => 'lightbox', :locals => { :pic => @referenz }
  end
  
  def sitemap
    @activio = 'sitemap'
     @title = 'sitemap'
    if Seite.find_by_name('sitemap')
      @seite = Seite.find_by_name('sitemap')
      if @seite && !@seite.sidebars.nil?
        @rightsides = @seite.sidebars
        @rightside = true if @rightsides.count > 0
      end
    end
  end
  
  #-#-#
  def fangseite
    @title = 'Agentur für visuelle Medien'
    render :layout => false
  end

  
end
