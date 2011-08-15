ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address => "eta.railshoster.de",
   :port => 25,
   :domain => "orangenwerk.com",
   :authentication => :login,
   :user_name => "info@vu2031.eta.railshoster.de",
   :password => "Psjsvrbn%31j",
}