# encoding: utf-8

class TerapeutaController < ApplicationController
  # GET /terapeuta
  # GET /terapeuta.json
  def index
    @search = Terapeutum.search(params[:search])
    @terapeutas = @search.order("plan desc, created_at desc")
    # @terapeutas.order("plan").desc

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terapeuta }
    end
  end
  
  def index2
    @search = Terapeutum.search(params[:search])
    @terapeutas = @search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terapeuta }
    end
  end
  
  def acceso_terapeutas
    
  end

  # GET /terapeuta/1
  # GET /terapeuta/1.json
  def show
    @terapeutum = Terapeutum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @terapeutum }
    end
  end

  # GET /terapeuta/new
  # GET /terapeuta/new.json
  def new
    @terapeutum = Terapeutum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @terapeutum }
    end
  end

  # GET /terapeuta/1/edit
  def edit
    @terapeutum = Terapeutum.find(params[:id])
  end

  # POST /terapeuta
  # POST /terapeuta.json
  def create
    @terapeutum = Terapeutum.new(params[:terapeutum])
    logger.debug "New terapeuta #{@terapeutum.attributes.inspect}"
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @terapeutum.password=random_password
    respond_to do |format|
      if @terapeutum.save
        TerapeutaMailer.send_password(@terapeutum,random_password).deliver
        format.html { redirect_to @terapeutum, notice: 'Terapeuta fue creado exitosamente.' }
        format.json { render json: @terapeutum, status: :created, location: @terapeutum }
      else
        format.html { render action: "new" }
        format.json { render json: @terapeutum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terapeuta/1
  # PUT /terapeuta/1.json
  def update
    @terapeutum = Terapeutum.find(params[:id])

    respond_to do |format|
      if @terapeutum.update_attributes(params[:terapeutum])
        format.html { redirect_to @terapeutum, notice: 'Terapeuta fue modificado exitosamente.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @terapeutum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terapeuta/1
  # DELETE /terapeuta/1.json
  def destroy
    @terapeutum = Terapeutum.find(params[:id])
    @terapeutum.destroy

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
    terapeuta = Terapeutum.find_by_email(params[:email_recovery])
    if terapeuta != nil
      random_password = Array.new(10).map { (65 + rand(58)).chr }.join
      terapeuta.password=random_password
      terapeuta.reset = 'y'
      terapeuta.save
      TerapeutaMailer.forgot_password(terapeuta,random_password).deliver
      redirect_to root_url, :notice => "Se ha enviado su contraseña a su casilla"
    else
      redirect_to forgot_password_path, :notice => "Correo electrónico no se encuentra registrado"  
    end
  end
end
