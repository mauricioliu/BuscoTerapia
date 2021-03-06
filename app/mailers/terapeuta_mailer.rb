# encoding: utf-8

class TerapeutaMailer < ActionMailer::Base
  default from: "no-reply@buscoterapia.cl"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.terapeuta_mailer.send_password.subject
  #
  def send_password(terapeuta, password)
    @password = password
    @terapeuta = terapeuta
     mail(:to => @terapeuta.email, :subject => "Bienvenido a BuscoTerapia.cl") do |format|
       format.html
     end
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
    
    recipients = RefDatum.where(:nombre => "Suscripcion Email")
    email = Array.new
    recipients.each do |recipient|
      email << recipient.valor
    end

    # mail(:to => email, :subject => "Un nuevo terapeuta se ha registrado")
    mail(:to => email, :subject => "Un nuevo terapeuta se ha registrado") do |format|
      format.html
    end
  end
  
  def contactar_terapeuta(terapeuta,cnombre,cemail,ctelefono,cmensaje)
    recipients = RefDatum.where(:nombre => "Contacto Email")
    email = Array.new
    recipients.each do |recipient|
      email << recipient.valor
    end
    #email << terapeuta.email
    
    @terapeuta = terapeuta
    @nombre = cnombre
    @email = cemail
    @telefono = ctelefono
    @mensaje = cmensaje

    # mail(:to => email, :subject => "Un nuevo terapeuta se ha registrado")
    mail(:to => terapeuta.email, :bcc => email, :subject => "Un usuario se ha tratado de contactar contigo "+@terapeuta.nombre) do |format|
      format.html
    end
  end
  
  def contacto(cnombre,cemail,cmensaje)
    recipients = RefDatum.where(:nombre => "Contacto Email")
    email = Array.new
    recipients.each do |recipient|
      email << recipient.valor
    end
    
    @nombre = cnombre
    @email = cemail
    @mensaje = cmensaje

    # mail(:to => email, :subject => "Un nuevo terapeuta se ha registrado")
    mail(:to => email, :subject => "Nuevo mensaje de contacto para BuscoTerapia") 
  end
  
  def validation_done(terapeuta)
    mail(:to => terapeuta.email, :subject => "Su ficha está activa.") do |format|
       format.html
    end
  end
end
