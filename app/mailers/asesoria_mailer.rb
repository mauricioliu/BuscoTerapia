class AsesoriaMailer < ActionMailer::Base
  default from: "do-not-reply@buscoterapia.com"
  
  def send_confirmation(asesoria)
    @asesoria = asesoria

     mail(:to => @asesoria.paciente_email, :subject => "Recibimos su solicitud")
  end
  
  def inform_request(asesoria)
    @asesoria = asesoria

    mail(:to => @asesoria.paciente_email, :subject => "Se ha ingresado una nueva solicitud") do |format|
      format.html
    end 
    
  end
end
