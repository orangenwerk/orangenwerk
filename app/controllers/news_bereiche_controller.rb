class NewsBereicheController < ApplicationController
  
  def index
    @activio = 'news'
    @title = 'news'
    @sidebar = true
    @news = NewsEintrag.limit(3)
    if Seite.find_by_name('news')
      @seite = Seite.find_by_name('news')
      if @seite && !@seite.sidebars.nil?
        @rightsides = @seite.sidebars
        @rightside = true if @rightsides.count > 0
      end
    end
  end

  def show
    @activio = 'news'
    @title = 'news'
    @sidebar = true
    if %w[aktuelles newsletter].include?(params[:name])
      @news_bereich = NewsBereich.find_by_name(params[:name])
      @title += ' . '+@news_bereich.titel.downcase
      if params[:name] == 'aktuelles'
        @news = NewsEintrag.all
        if params[:paramx]
          @newsname = params[:paramx]
        end
      end
    else 
      @news_bereiche = NewsBereich.all
      if Seite.find_by_name('news')
        @seite = Seite.find_by_name('news')
        if @seite && !@seite.sidebars.nil?
          @rightsides = @seite.sidebars
          @rightside = true if @rightsides.count > 0
        end
      end
    end
  end
  
  def newsletter_on
    @activio = 'news'
    @title = 'news'
    @sidebar = true
     @news_bereich = NewsBereich.find_by_name('newsletter')
     @newsletter_abo = NewsletterAbo.new
  end
  
  def newsletter_off
      @activio = 'news'
    @title = 'news'
    @sidebar = true
      @news_bereich = NewsBereich.find_by_name('newsletter')
      @newsletter_abo = NewsletterAbo.new
  end
  
  def newsletter_search
    @activio = 'news'
    @title = 'news'
    @sidebar = true
    if NewsletterAbo.find_by_email(params[:newsletter_abo][:email])
      @newsletter_abo = NewsletterAbo.find_by_email(params[:newsletter_abo][:email])
      respond_to do |format|
        flash.now[:notice] = 'Ihre E-Mail-Adresse wurde gefunden.'
        format.html 
        format.js { render "newsletter_kill" }
      end
    else
      @newsletter_abo = NewsletterAbo.new
      respond_to do |format|
        flash.now[:alert] = 'Diese E-Mail-Adresse wurde nicht gefunden!'
        format.html { render :action => "newsletter_off" }
        format.js { render "newsletter_off" }
      end
      
      
    end
  end
  
  def newsletter_safe
    @news_bereich = NewsBereich.find_by_name('newsletter')
    @newsletter_abo = NewsletterAbo.new(params[:newsletter_abo])
    @sidebar = true
    @activio = 'news'
    @title = 'news'
    respond_to do |format|
      if @newsletter_abo.save
        @na_state = 'on'
        flash[:notice] = 'Newsletter wurde erfolgreich abonniert.'
        NewsletterMailer.info(@newsletter_abo, @na_state).deliver
        NewsletterMailer.antwort(@newsletter_abo, @na_state).deliver
        format.html { redirect_to('/news/aktuelles') }
        format.js { render "newsletter_safed" }
      else
        # => flash.now[:alert] = 'fehler ! . ! . !'
        format.html { render :action => "newsletter_on" }
        format.js { render "newsletter_on" }
      end
    end
  end
  
  def newsletter_kill
    @newsletter_abo = NewsletterAbo.find(params[:newsletter_abo][:id])
    @na = @newsletter_abo
    @na_state = 'off'
    @newsletter_abo.destroy
    NewsletterMailer.info(@na, @na_state).deliver
    NewsletterMailer.antwort(@na, @na_state).deliver
    respond_to do |format|
      flash[:notice] = 'Ihre E-Mail-Adresse wurde aus unserem Verteiler gelöscht.'
      format.html { redirect_to(root_path) }
      format.js { render "newsletter_safed" }
    end
  end

end
