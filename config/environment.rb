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
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'www.buscoterapia.com',
    :user_name            => 'liu.mauricio',
    :password             => 'rdte8722',
    :authentication       => 'plain',
    :enable_starttls_auto => true  
    }
  end