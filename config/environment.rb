# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Harpuun::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => "freyam13",
  :password => "harpuun2012",
  :domain => "harpuun.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
