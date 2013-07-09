class KontaktMailer < ActionMailer::Base
  default :from => "kontakt@orangenwerk.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.kontakt.subject
  #
  def kontakt(kontakt)
    @kontakt = kontakt
    @std_domain = 'orangenwerk.com'
    # => mail :to => abo.email
    mail    :to       => 'info@orangenwerk.com',
            :bcc      => ["Peter <p.klar@orangenwerk.com>", "Marco <m.sebald@orangenwerk.com>", "Admin <web@orangenwerk.com>"],
            :reply_to => @kontakt.email,
            :subject  => "orangenwerk-Kontakt - #{ @kontakt.geschlecht } #{ @kontakt.name }"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.sofortkontakt.subject
  #
  def sofortkontakt
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.rueckruf.subject
  #
  def rueckruf
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.anfrage.subject
  #
  def anfrage
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.antwort.subject
  #
  def antwort
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.info.subject
  #
  def info(kontakt)
    @kontakt = kontakt
    @std_domain = 'orangenwerk.com'
    # => mail :to => abo.email
    mail(:to => @kontakt.email,
         :subject => "#{ @std_domain } - Kontakt!")
  end
end
