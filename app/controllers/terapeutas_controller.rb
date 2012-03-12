# encoding: utf-8
require 'date'

class TerapeutasController < ApplicationController
  layout :resolve_layout 
  
  
  before_filter :authenticate, :only => :edit
  # GET /terapeuta
  # GET /terapeuta.json
  def index
    @sepa = params[:search]
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.order("rand()")
    @terapeutas = @terapeutas.where("estado = 'validado'")
    
    # terapeutas_pagado = @terapeutas.where()
    
    @terapeutas = @terapeutas.page(params[:page]).per_page(10)
    # @terapeutas.order("plan").desc

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terapeuta }
    end
  end
  
  def index2
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.page(params[:page]).per_page(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terapeuta }
    end
  end
  
  # GET /terapeuta/1
  # GET /terapeuta/1.json
  def show
    @terapeuta = Terapeuta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @terapeuta }
    end
  end
  
  def acceso_terapeutas
    
  end

  # GET /terapeuta/new
  # GET /terapeuta/new.json
  def new
    @tipo_suscripcion = params[:tipo]
    #tipo de pago
    @terapeuta = Terapeuta.new
    
    if @tipo_suscripcion == "gratuito"
      @terapeuta.plan_tipo = "Gratis"
      @terapeuta.plan_ciclo = "Gratis"
    else
      @plan_trimestral = RefDatum.find_by_nombre("Plan Trimestral").valor
      @plan_semestral = RefDatum.find_by_nombre("Plan Semestral").valor
      @plan_anual = RefDatum.find_by_nombre("Plan Anual").valor
    end
    
    @terapeuta.especialidades.build
    @terapeuta.estudios.build
    @terapeuta.convenios.build
    
    @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
    @especialidades = RefDatum.where(:nombre => "Especialidad")
    @forma_pagos = RefDatum.where(:nombre => "Formas de Pago")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @terapeuta }
    end
  end

  # GET /terapeuta/1/edit
  def edit
    @terapeuta = Terapeuta.find(params[:id])
    if @terapeuta.id != session[:terapeuta].id
      redirect_to root_url
    else
      @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
      @especialidades = RefDatum.where(:nombre => "Especialidad")
      @forma_pagos = RefDatum.where(:nombre => "Formas de Pago")      
    end
  end

  # POST /terapeuta
  # POST /terapeuta.json
  def create
    @terapeuta = Terapeuta.new(params[:terapeuta])
    @terapeuta.estado = "pendiente de validar"
    
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @terapeuta.password=random_password
    tipo_terapias = params[:tipo_terapia_ids]
    if tipo_terapias
      tipo_terapias.each do |tt|
        @terapeuta.tipo_terapias.build(:nombre => tt )
      end
    end
    
    forma_pagos = params[:forma_pago_ids]
    if forma_pagos
      forma_pagos.each do |tt|
        @terapeuta.forma_pagos.build(:valor => tt )
      end
    end
    
    respond_to do |format|
      if @terapeuta.save
        TerapeutaMailer.send_password(@terapeuta,random_password).deliver
        TerapeutaMailer.notify_new_terapeuta(@terapeuta).deliver
        if @terapeuta.plan_ciclo != "Gratis"
          @pago = @terapeuta.pagos.create(:tipo => "Suscripcion Completa "+@terapeuta.plan_ciclo, 
                                          :monto => RefDatum.where(:nombre => "Plan "+@terapeuta.plan_ciclo).first().valor, 
                                          :estado => "pendiente" )
          @pago_codigo = "Susc-BT-"+@terapeuta.plan_ciclo
          
          @success_url = root_url + "payment_success?code="+encrypt_url(@terapeuta.email+"|||"+@terapeuta.id.to_s+"|||"+@pago.id.to_s+"|||pago exitoso a través de dinero mail")
          format.html { render "submit_payment" }
          #format.html { redirect_to @terapeuta, notice: 'Terapeuta fue creado exitosamente.' }
          #format.json { render json: @terapeuta, status: :created, location: @terapeuta }  
        else
          format.html { redirect_to @terapeuta, notice: 'Terapeuta fue creado exitosamente.' }
        end
      else
        @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
        @forma_pagos = RefDatum.where(:nombre => "Formas de Pago")
        @plan_trimestral = RefDatum.find_by_nombre("Plan Trimestral").valor
        @plan_semestral = RefDatum.find_by_nombre("Plan Semestral").valor
        @plan_anual = RefDatum.find_by_nombre("Plan Anual").valor
        format.html { render action: "new" }
        format.json { render json: @terapeuta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terapeuta/1
  # PUT /terapeuta/1.json
  def update
    @terapeuta = Terapeuta.find(params[:id])
    @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
    @especialidades = RefDatum.where(:nombre => "Especialidad")
    @forma_pagos = RefDatum.where(:nombre => "Formas de Pago")

    respond_to do |format|
      if @terapeuta.update_attributes(params[:terapeuta])
        format.html { redirect_to @terapeuta, notice: 'Terapeuta fue modificado exitosamente.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @terapeuta.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_password
    email = decrypt_url(params[:email])
    terapeuta = Terapeuta.find_by_email(email)
    if terapeuta && params[:password] == params[:password_confirmation] 
      terapeuta.password = params[:password] 
      terapeuta.last_logged_in = Time.now
      terapeuta.reset = 'n'
      terapeuta.save!
      redirect_to root_url, :notice => "Contraseña modificada exitosamente"
    else
      render "change_password", :notice => "Ambas contraseñas deben ser iguales"
    end
  end

  def reset_password
    terapeuta = Terapeuta.find_by_email(params[:email_recovery])
    if terapeuta != nil
      reset_password_link = root_url + "validate_email?code="+encrypt_url(terapeuta.email+"|||"+Date.today.to_s)
      
      TerapeutaMailer.forgot_password(terapeuta,reset_password_link).deliver
      redirect_to root_url, :notice => "Se ha enviado su contraseña a su casilla"
    else
      redirect_to forgot_password_path, :notice => "Correo electrónico no se encuentra registrado"  
    end
  end
  
  def validate_email
    begin
      code = decrypt_url(params[:code])
      code = code.split('|||')
      email = code[0]
      date = code[1]
      terapeuta = Terapeuta.find_by_email(email)
      
      if terapeuta && date == Date.today.to_s 
        @enc_email = encrypt_url(email)
        render "change_password"
      else
        render "validate_email"
      end
      rescue
        render root_url
      end 
  end
  
  def payment_success
    begin
      @estado = "Hubo un problema con la transacción"
      code = decrypt_url(params[:code])
      code = code.split('|||')
      email = code[0]
      tid = code[1]
      pid = code[2]
      status = code[3]
      
      terapeuta = Terapeuta.find(tid)
      if terapeuta.email == email
        pago = terapeuta.pagos.find(pid)
        if pago && pago.estado == "pendiente"
          terapeuta.plan_tipo = pago.tipo
          pago.estado = status
          pago.fecha_pago = Date.today
          pago.save
          terapeuta.save
          @estado = code
        end
      end
    rescue Exception => e
      logger.error "payment_success error"
      logger.error e.message  
    end
  end
  
  def contactar_terapeuta
    
  end
  
  def estadisticas
    
  end
  
  def plan_beneficios
    
  end

private 
  def resolve_layout
    case action_name
    when "edit","show","estadisticas","plan_beneficios"
      "portal_terapeuta"
    else
      "application"
    end
  end
end
