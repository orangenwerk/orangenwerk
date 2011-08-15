# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rails1::Application.initialize!

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
     :address => 'mail.kundenportal.railshoster.de',
     :domain => "orangenwerk.com",
     :port => 25,
     :authentication => 'plain',
     :user_name => 'seite@orangenwerk.com',
     :password => 'mHN$yrYLNnNPB'
  }
