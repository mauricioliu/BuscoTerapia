# encoding: utf-8

class TerapeutasController < ApplicationController
  before_filter :authenticate, :only => :edit
  # GET /terapeuta
  # GET /terapeuta.json
  def index
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.order("plan_tipo desc, created_at desc")
    @terapeutas = @terapeutas.page(params[:page]).per_page(15)
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
    @terapeuta = Terapeuta.new
    @terapeuta.especialidades.build
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
    @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
    @especialidades = RefDatum.where(:nombre => "Especialidad")
    @forma_pagos = RefDatum.where(:nombre => "Formas de Pago")
  end

  # POST /terapeuta
  # POST /terapeuta.json
  def create
    @terapeuta = Terapeuta.new(params[:terapeuta])
    
    logger.debug "New terapeuta #{@terapeuta.attributes.inspect}"
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
        if @terapeuta.plan_ciclo != "Gratis"
          @pago = @terapeuta.pagos.create(:tipo => "Suscripcion Completa "+@terapeuta.plan_ciclo, 
                                          :monto => RefDatum.where(:nombre => "Plan "+@terapeuta.plan_ciclo).first().valor, 
                                          :estado => "pendiente" )
          @pago_codigo = "Susc-BT-"+@terapeuta.plan_ciclo
          
          @success_url = root_url + "payment_success?email="+encrypt_url(@terapeuta.email)+"&tid="+encrypt_url(@terapeuta.id)+"&pid="+encrypt_url(@pago.id)
          format.html { render "submit_payment" }
          #format.html { redirect_to @terapeuta, notice: 'Terapeuta fue creado exitosamente.' }
          #format.json { render json: @terapeuta, status: :created, location: @terapeuta }  
        else
          format.html { redirect_to @terapeuta, notice: 'Terapeuta fue creado exitosamente.' }
        end
      else
        @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
        @forma_pagos = RefDatum.where(:nombre => "Formas de Pago")
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

  # DELETE /terapeuta/1
  # DELETE /terapeuta/1.json
  def destroy
    @terapeuta = Terapeuta.find(params[:id])
    @terapeuta.destroy

    respond_to do |format|
      format.html { redirect_to terapeuta_url }
      format.json { head :ok }
    end
  end
  
  def change_password
    if params[:password] == params[:password_confirmation]
      terapeuta = session[:terapeuta]
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
      # random_password = Array.new(10).map { (65 + rand(58)).chr }.join
      # terapeuta.password=random_password
      # terapeuta.reset = 'y'
      # terapeuta.save
      # cipher = Gibberish::AES.new("lOl!123?")
      # enc_email = cipher.enc(terapeuta.email)
      # enc_email = Base64.urlsafe_encode64(enc_email)
    
      reset_password_link = root_url + "validate_email?email="+encrypt_url(terapeuta.email)
      
      TerapeutaMailer.forgot_password(terapeuta,reset_password_link).deliver
      redirect_to root_url, :notice => "Se ha enviado su contraseña a su casilla"
    else
      redirect_to forgot_password_path, :notice => "Correo electrónico no se encuentra registrado"  
    end
  end
  
  def validate_email
    begin
      # cipher = Gibberish::AES.new("lOl!123?")
      #puts "123email"
      #puts params[:email]
      email = decrypt_url(params[:email])
      # email = cipher.dec(email) 
      terapeuta = Terapeuta.find_by_email(email)
      
      #@pp = cipher.enc("liu.mauricio@gmail.com")
      #@pp = Base64.urlsafe_encode64(@pp)
      if terapeuta
        # session[:terapeuta] = terapeuta
        render "change_password"
      else
        redirect_to root_url
      end
      rescue
        render "validate_email"
        @pp = session
      end 
  end
  
  def payment_success
    @estado = "Hubo un problema con la transacción"
    email = decrypt_url(params[:email])
    tid = decrypt_url(params[:tid])
    pid = decrypt_url(params[:pid])
    terapeuta = Terapeuta.find(tid)
    if terapeuta.email == email
      pago = terapeuta.pagos.find(pid)
      if pago && pago.estado == "pendiente"
        pago.estado = "dm validado"
        pago.save
        @estado = "transacción terminada exitósamente"
      end
    end
  end  

private  
  def encrypt_url(url)
    cipher = Gibberish::AES.new("lOl!123?")
    enc_url = cipher.enc(url.to_s)
    return Base64.urlsafe_encode64(enc_url)
  end
  
  def decrypt_url(url)
    cipher = Gibberish::AES.new("lOl!123?")
    dec_url = Base64.urlsafe_decode64(url)
    return cipher.dec(dec_url) 
  end
end
