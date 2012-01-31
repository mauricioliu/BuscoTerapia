# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

BuscoTerapia::Application.initialize!

BuscoTerapia::Application.configure do
  config.gem 'bcrypt-ruby', :lib => 'bcrypt'
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    :address              => "smtp.mailgun.org",
    :port                 => 25,
    :domain               => 'www.buscoterapia.com',
    :user_name            => 'no-responder@buscoterapia.mailgun.org',
    :password             => 'abc.123',
    :authentication       => 'plain',
    :enable_starttls_auto => true  
    }
  end