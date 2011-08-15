class KontaktBereicheController < ApplicationController
  
  def index
    @activio = 'kontakt'
    @title = 'kontakt'
    @sidebar = true
    if Seite.find_by_name('kontakt')
      @seite = Seite.find_by_name('kontakt')
      if @seite && !@seite.sidebars.nil?
        @rightsides = @seite.sidebars
        @rightside = true if @rightsides.count > 0
      end
    end
  end

  def show
    @activio = 'kontakt'
    @title = 'kontakt'
    @sidebar = true
    if %w[kontaktdaten agbs AGBs faqs FAQs unternehmen webtips downloads].include?(params[:name])
      @kontakt = KontaktBereich.find_by_name(params[:name])
      @title += ' . '+@kontakt.titel.downcase
    else
      @kontakte = KontaktBereich.all
      if Seite.find_by_name('kontakt')
      @seite = Seite.find_by_name('kontakt')
      if @seite && !@seite.sidebars.nil?
        @rightsides = @seite.sidebars
        @rightside = true if @rightsides.count > 0
      end
    end
    end
  end
  
  def katshow
    @activio = 'kontakt'
    @sidebar = true
    @title = 'kontakt'+params[:name]+params[:paramx]
    @kontakt = KontaktBereich.find_by_name(params[:name])
    @kontakt_k = KontaktKategorie.find_by_name(params[:paramx])
    @title = 'kontakt'+' . '+@kontakt.name+' . '+@kontakt_k.name
    if params[:paramx] == 'kontakt'
      @xmail_kontakt = XmailKontakt.new
    end
    
  end
  
  def agbs
    @activio = 'kontakt'
    @sidebar = true
    @kontakt = KontaktBereich.find_by_name('agb')
    @agbs = Agb.all
  end
  
  def faqs
    @activio = 'kontakt'
    @sidebar = true
    @kontakt = KontaktBereich.find_by_name('faqs')
    @faqs = Faq.all
  end
  
  def kontaktmail_safe
    @activio = 'kontakt'
    @sidebar = true
    @kontakt = KontaktBereich.find_by_name('kontaktdaten')
    @kontakt_k = KontaktKategorie.find_by_name('kontakt')
    @xmail_kontakt = XmailKontakt.new(params[:xmail_kontakt])
    @sidebar = true
    respond_to do |format|
      if @xmail_kontakt.valid?
        @na_state = 'on'
        KontaktMailer.info(@xmail_kontakt).deliver
        KontaktMailer.kontakt(@xmail_kontakt).deliver
        format.html { redirect_to(root_path, :notice => 'Kontakt wurde erfolgreich gesendet.') }
        format.js { render "kontakt_send.js.erb" }
      else
        format.html { render :action => "katshow" }
        format.js { render "katshow.js.erb" }
      end
    end
  end
  

end
