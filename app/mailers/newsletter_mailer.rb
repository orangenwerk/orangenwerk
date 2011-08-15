class NewsletterMailer < ActionMailer::Base
  default :from => "newsletter@orangenwerk.com"
  

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.newsletter.subject
  #
  def newsletter
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.info.subject
  #
  def info(abo, state)
    @greeting = "Hi"
    @abo = abo
    @na_state = state
    @std_domain = 'orangenwerk.com'
    if state == 'on'
      verter = 'Neues'
    elsif state == 'off'
      verter = 'Lösche'
    end
    # => mail :to => "admin@2strange.net"
    mail(:to => "strangeaustin@googlemail.com",
         :subject => "#{ verter } NewsletterAbo von #{ abo.name }!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.antwort.subject
  #
  def antwort(abo, state)
    @greeting = "Hi"
    @abo = abo
    @na_state = state
    @std_domain = 'orangenwerk.com'
    if state == 'on'
      verter = 'Registrierung'
    elsif state == 'off'
      verter = 'Abmeldung'
    end
    # => mail :to => abo.email
    mail(:to => abo.email,
         :subject => "Newsletter #{ verter } #{ @std_domain }!")
  end
end
