class AsesoriaMailer < ActionMailer::Base
  default from: "do-not-reply@buscoterapia.com"
  
  def send_confirmation(asesoria)
    @asesoria = asesoria

     mail(:to => @asesoria.paciente_email, :subject => "Recibimos su solicitud")
  end
  
  def inform_request(asesoria)
    @asesoria = asesoria
    recipients = RefDatum.where(:nombre => "Back Office Email")
    email = Array.new
    recipients.each do |recipient|
      email << recipient.valor
    end

    mail(:to => email, :subject => "Se ha ingresado una nueva solicitud")
  end
end
