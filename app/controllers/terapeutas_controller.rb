# encoding: utf-8

class TerapeutasController < ApplicationController
  # GET /terapeuta
  # GET /terapeuta.json
  def index
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.order("plan desc, created_at desc")
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
  
  def acceso_terapeutas
    
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

  # GET /terapeuta/new
  # GET /terapeuta/new.json
  def new
    @terapeuta = Terapeuta.new
    @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
    @especialidades = RefDatum.where(:nombre => "Especialidad")

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
  end

  # POST /terapeuta
  # POST /terapeuta.json
  def create
    @terapeuta = Terapeuta.new(params[:terapeuta])
    logger.debug "New terapeuta #{@terapeuta.attributes.inspect}"
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @terapeuta.password=random_password
    respond_to do |format|
      if @terapeuta.save
        tipo_terapias = params[:tipo_terapia_ids]
        tipo_terapias.each do |tt|
          @terapeuta.tipo_terapias.create(:nombre => tt)
        end
        TerapeutaMailer.send_password(@terapeuta,random_password).deliver
        format.html { redirect_to @terapeuta, notice: 'Terapeuta fue creado exitosamente.' }
        format.json { render json: @terapeuta, status: :created, location: @terapeuta }
      else
        @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
        format.html { render action: "new" }
        format.json { render json: @terapeuta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terapeuta/1
  # PUT /terapeuta/1.json
  def update
    @terapeuta = Terapeuta.find(params[:id])

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
