class AdminController < ApplicationController
  http_basic_authenticate_with :name => "btp", :password => "btp.123!"
  
  def index
  end
  
  def asesorias_index
    if params[:filtro]
      @asesorias = Asesoria.where("status = ?", params[:filtro]).order("id desc")
    else
      @asesorias = Asesoria.where("status <> 'cerrado'").order("id desc")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asesorias }
    end
  end
  
  def ver_asesoria
    @asesoria = Asesoria.find(params[:id])
    if @asesoria.status == "nuevo"
      @asesoria.status = "pendiente"
      @asesoria.save
    end
  end
  
  def cambiar_asesoria_status
    @asesoria = Asesoria.find(params[:asesoria_id])
    @asesoria.status = params[:asesoria][:status]
    if @asesoria.status == "agendado"
      @asesoria.terapeuta_id = params[:asesoria][:terapeuta_id]
    else
      @asesoria.terapeuta_id = nil
    end
    @asesoria.comentarios = params[:asesoria][:comentarios]
    if @asesoria.changed?
      @asesoria_h = AsesoriaH.new
      @asesoria_h.asesoria_id = @asesoria.id
      @asesoria_h.status = @asesoria.status
      if @asesoria.status == "agendado"
        @asesoria_h.comentarios = "Agendado a: " + @asesoria.terapeuta.nombre + "\n" + @asesoria.comentarios
      else
        @asesoria_h.comentarios = @asesoria.comentarios
      end
      @asesoria_h.save
      @asesoria.save
    end
    redirect_to ver_asesoria_path(@asesoria)
  end
end
