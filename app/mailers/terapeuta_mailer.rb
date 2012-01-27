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

     mail(:to => "liu.mauricio@gmail.com", :subject => "Bienvenido a BuscoTerapia.cl")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.terapeuta_mailer.forgot_password.subject
  #
  def forgot_password(terapeuta, password)
    @password = password
    @terapeuta = terapeuta

     mail(:to => "liu.mauricio@gmail.com", :subject => "Solicitud de contraseña BuscoTerapia.cl")
  end
end
