# encoding: utf-8
class AsesoriasController < ApplicationController
  before_filter :set_title
  # GET /asesoria
  # GET /asesoria.json
  def index
    @asesorias = Asesoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asesorias }
    end
  end

  # GET /asesoria/1
  # GET /asesoria/1.json
  def show
    @asesoria = Asesoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asesoria }
    end
  end

  # GET /asesoria/new
  # GET /asesoria/new.json
  def new
    #session[:asesoria_step] = nil
    session[:asesoria_params] = {}
    @asesoria = Asesoria.new
    @asesoria.current_step = "miproblema"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asesoria }
    end
  end

  # GET /asesoria/1/edit
  def edit
    @asesoria = Asesoria.find(params[:id])
  end

  # POST /asesoria
  # POST /asesoria.json
  def create
    session[:asesoria_params].deep_merge!(params[:asesoria]) if params[:asesoria]
    @params = session[:asesoria_params]
    @asesoria = Asesoria.new(session[:asesoria_params])
    @asesoria.current_step = params[:step].to_s
    @dias_atencion = RefDatum.where(:nombre => "Dia atencion")
    if @asesoria.valid?
      if params[:previous_button]
        @asesoria.previous_step
      elsif params[:step].to_s == "misdatos"
        dias_atencion = params[:dia_atencion_ids]
        if dias_atencion
          dias_atencion.each do |tt|
            @asesoria.dias_atencion.build(:dia => tt )
          end
        end
        @asesoria.save
      else
        @asesoria.next_step
      end
      # session[:asesoria_step] = @asesoria.current_step
    end
    
    if @asesoria.new_record?
      render 'new'
    else
      #session[:asesoria_step] = nil
      session[:asesoria_params] ||= {}
      redirect_to ver_comprobante_path(@asesoria)
    end
  end

  # PUT /asesoria/1
  # PUT /asesoria/1.json
  def update
    @asesoria = Asesoria.find(params[:id])

    respond_to do |format|
      if @asesoria.update_attributes(params[:asesoria])
        format.html { redirect_to @asesoria, notice: 'Asesoria was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @asesoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asesoria/1
  # DELETE /asesoria/1.json
  def destroy
    @asesoria = Asesoria.find(params[:id])
    @asesoria.destroy

    respond_to do |format|
      format.html { redirect_to asesoria_url }
      format.json { head :ok }
    end
  end
  
  def ver_comprobante
    @asesoria = Asesoria.find(params[:id])
    AsesoriaMailer.send_confirmation(@asesoria).deliver
    AsesoriaMailer.inform_request(@asesoria).deliver
  end

private
  def set_title
    @title = "Asesórate con nuestros profesionales"
    @description = "Nuestro equipo de profesionales te ofrece sin costo y en menos de 90 minutos la información necesaria para que elijas la terapia que sea más beneficiosa"
    @menu = "asesoria"
  end
end
