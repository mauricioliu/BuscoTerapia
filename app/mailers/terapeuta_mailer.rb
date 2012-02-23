# encoding: utf-8

class TerapeutaMailer < ActionMailer::Base
  default from: "do-not-reply@buscoterapia.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.terapeuta_mailer.send_password.subject
  #
  def send_password(terapeuta, password)
    @password = password
    @terapeuta = terapeuta

     mail(:to => @terapeuta.email, :subject => "Bienvenido a BuscoTerapia.cl")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.terapeuta_mailer.forgot_password.subject
  #
  def forgot_password(terapeuta,reset_password_link)
    @terapeuta = terapeuta
    @reset_password_link = reset_password_link
    
     mail(:to => @terapeuta.email, :subject => "Solicitud de contraseña BuscoTerapia.cl") do |format|
      format.html
    end
  end
  
  def notify_new_terapeuta(terapeuta)
    @terapeuta = terapeuta
    
    recipients = RefDatum.where(:nombre => "Back Office Email")
    email = Array.new
    recipients.each do |recipient|
      email << recipient.valor
    end

    # mail(:to => email, :subject => "Un nuevo terapeuta se ha registrado")
    mail(:to => email, :subject => "Un nuevo terapeuta se ha registrado") do |format|
      format.html
    end
  end
end
