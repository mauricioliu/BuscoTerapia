class AsesoriaMailer < ActionMailer::Base
  default from: "no-reply@buscoterapia.cl"
  
  def send_confirmation(asesoria)
    @asesoria = asesoria

     mail(:to => @asesoria.paciente_email, :subject => "Recibimos su solicitud") do |format|
       format.html
     end
  end
  
  def inform_request(asesoria)
    @asesoria = asesoria
    recipients = RefDatum.where(:nombre => "Back Office Email")
    email = Array.new
    recipients.each do |recipient|
      email << recipient.valor
    end

    mail(:to => email, :subject => "Solicitud N#"+@asesoria.id.to_s+" "+@asesoria.paciente_nombre)
  end
end
