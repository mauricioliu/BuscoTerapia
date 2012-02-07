require 'tlsmail'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Encoding.default_external = Encoding::UTF_8

BuscoTerapia::Application.initialize!

BuscoTerapia::Application.configure do
  config.gem 'bcrypt-ruby', :lib => 'bcrypt'
  end

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true


ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,  
  :address => 'smtp.mailgun.org',
  :port => 25,
  :domain => 'www.buscoterapia.com',
  :user_name => 'no-responder@buscoterapia.mailgun.org',
  :password => 'abc.123',
  :authentication => 'plain',
  :enable_starttls_auto => true
} 