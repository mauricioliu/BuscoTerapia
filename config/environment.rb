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


#ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#  errors = Array(instance.error_message).join(', ')
#  %(<div class="form-block alerta">#{html_tag}</div><p class="aviso">&nbsp;#{errors}</span>).html_safe
#end

