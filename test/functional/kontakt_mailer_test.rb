require 'test_helper'

class KontaktMailerTest < ActionMailer::TestCase
  test "kontakt" do
    mail = KontaktMailer.kontakt
    assert_equal "Kontakt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "sofortkontakt" do
    mail = KontaktMailer.sofortkontakt
    assert_equal "Sofortkontakt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "rueckruf" do
    mail = KontaktMailer.rueckruf
    assert_equal "Rueckruf", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "anfrage" do
    mail = KontaktMailer.anfrage
    assert_equal "Anfrage", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "antwort" do
    mail = KontaktMailer.antwort
    assert_equal "Antwort", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "info" do
    mail = KontaktMailer.info
    assert_equal "Info", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
