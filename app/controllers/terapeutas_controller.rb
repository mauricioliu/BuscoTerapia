# encoding: utf-8
require 'date'

class TerapeutasController < ApplicationController
  before_filter :set_title
  layout :resolve_layout 
  
  
  before_filter :authenticate, :only => :edit
  # GET /terapeuta
  # GET /terapeuta.json
  def index
    @today = Time.now
    @sepa = params
    @h = Hash.new
    @h["estado"] = "validado"
    if @sepa[:search] != nil
      if params[:form] != nil and params[:form][:tipo_terapeuta] != nil and params[:form][:tipo_terapeuta] != ''
        @search_me = escape_characters_in_string(params[:form][:tipo_terapeuta])
      end
      if params[:form] != nil and params[:form][:region] != nil and params[:form][:region] != '' 
        @h["region"] = params[:form][:region]
      end
      if params[:form] != nil and params[:form][:comuna] != nil and params[:form][:comuna] != ''
        @h["comuna"] = params[:form][:comuna]
      end
        temp = @search_me == nil ? '' : @search_me 
        @terapeutas = Terapeuta.search(params[:search].to_s + " " +temp, 
                                     :page => params[:page], :per_page => 10,
                                     :conditions => @h,
                                     :sort_mode => :extended,
                                     :match_mode => :extended,
                                     :order => "plan_tipo desc random_me desc")
        @total = @terapeutas.total_entries
    end
    # @search = Terapeuta.search(params[:search])
    # @terapeutas = @search.order("rand()")
    # @terapeutas = @terapeutas.where("estado = 'validado'")
    
    # terapeutas_pagado = @terapeutas.where()
    
    # @terapeutas = @terapeutas.page(params[:page]).per_page(10)
    # @terapeutas.order("plan").desc

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terapeuta }
    end
  end
  
  # GET /terapeuta/1
  # GET /terapeuta/1.json
  def show
    @terapeuta = Terapeuta.find(params[:id])
    @title = @terapeuta.nombre

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @terapeuta }
    end
  end
  
  def ver_ficha
    @terapeuta = Terapeuta.find(params[:id])
    @contacto = true
    @title = @terapeuta.nombre
    
    registrar_visita(@terapeuta.id)
    
    render "show"
  end
  
  def acceso_terapeutas
    @menu = "acceso terapeuta"
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
    @title = @terapeuta.nombre
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
    @terapeuta.plan_tipo = "Gratis"
    
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
    
    tipo_terapias = params[:tipo_terapia_ids]
    if tipo_terapias
      if @terapeuta.tipo_terapias.size != tipo_terapias.size
        @terapeuta.tipo_terapias.delete_all
        tipo_terapias.each do |tt|
          @terapeuta.tipo_terapias.build(:nombre => tt )
        end
      end
    elsif @terapeuta.tipo_terapias.size != 0
      @terapeuta.tipo_terapias.delete_all
    end
    
    forma_pagos = params[:forma_pago_ids]
    if forma_pagos
      if @terapeuta.forma_pagos.size != forma_pagos.size
        @terapeuta.forma_pagos.delete_all
        forma_pagos.each do |tt|
          @terapeuta.forma_pagos.build(:valor => tt )
        end
      end
    elsif @terapeuta.forma_pagos.size != 0
      @terapeuta.forma_pagos.delete_all
    end
    
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
      redirect_to root_url(:notice => "Se ha enviado su contraseña a su casilla")
    else
      redirect_to forgot_password_path(:notice => "Correo electrónico no se encuentra registrado")  
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
          terapeuta.plan_tipo = "pagado"
          if pago.tipo = "Suscripcion Completa Anual"
            terapeuta.plan_expira =  1.year.from_now
          elsif pago.tipo = "Suscripcion Completa Semestral"
            terapeuta.plan_expira =  6.month.from_now
          else 
            terapeuta.plan_expira =  3.month.from_now
          end
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
    terapeuta = params[:terapeuta_nombre]
    nombre = params[:nombre]
    email = params[:email]
    telefono = params[:telefono]
    mensaje = params[:mensaje]
    TerapeutaMailer.contactar_terapeuta(terapeuta,nombre,email,telefono,mensaje).deliver
    
    redirect_to terapeutas_path
  end
  
  def visita
    #terapeuta = Terapeuta.find(params[:id])
    registrar_visita(params[:id])
    
    respond_to do |format|
      format.js
    end
  end
  
  def estadisticas
    
  end
  
  def plan_beneficios
    
  end

  def calendario
    @event = Event.new
  end
  
  def upgrade_plan
    @terapeuta = Terapeuta.find(params[:id])
    plan_ciclo = params[:plan_ciclo]
    Pago.delete_all(:terapeuta_id => @terapeuta.id, :estado => 'pendiente')
    @pago = @terapeuta.pagos.create(:tipo => "Suscripcion Completa "+plan_ciclo, 
                                              :monto => RefDatum.where(:nombre => "Plan "+plan_ciclo).first().valor, 
                                              :estado => "pendiente" )
    @pago_codigo = "Susc-BT-"+plan_ciclo
    
    @success_url = root_url + "payment_success?code="+encrypt_url(@terapeuta.email+"|||"+@terapeuta.id.to_s+"|||"+@terapeuta.id.to_s+"|||pago exitoso a través de dinero mail")
    render "submit_payment" 
  end
  
private 
  def resolve_layout
    case action_name
    when "edit","show","estadisticas","plan_beneficios", "calendario"
      "portal_terapeuta"
    else
      "application"
    end
  end
  
  def escape_characters_in_string(string)
    pattern = /(\'|\"|\.|\*|\/|\-|\\)/
    string.gsub(pattern){|match|"\\"  + match} # <-- Trying to take the currently found match and add a \ before it I have no idea how to do that).
  end

  def set_title
    @title = "Terapeutas"
    @menu = "buscar terapeuta" 
    if params[:notice]
      @notice = params[:notice]
    end  
  end  
  
  def registrar_visita(terapeuta_id)
    visita = Visitas.where("terapeuta_id = ? and 
                            YEAR(created_at) = ? and 
                            MONTH(created_at) = ? and 
                            DAY(created_at) = ?",
                            terapeuta_id,Time.now.year,Time.now.month,Time.now.day).first()
    if visita
      visita.cantidad = visita.cantidad + 1
      visita.save 
    else
      visita = Visitas.new
      visita.terapeuta_id = terapeuta_id
      visita.cantidad = 1
      visita.save  
    end
  end
end
