class AsesoriaController < ApplicationController
  # GET /asesoria
  # GET /asesoria.json
  def index
    @asesoria = Asesorium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asesoria }
    end
  end

  # GET /asesoria/1
  # GET /asesoria/1.json
  def show
    @asesorium = Asesorium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asesorium }
    end
  end

  # GET /asesoria/new
  # GET /asesoria/new.json
  def new
    session[:asesorium_step] = nil
    session[:asesorium_params] ||= {}
    @asesorium = Asesorium.new
    @asesorium.current_step = session[:asesorium_step]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asesorium }
    end
  end

  # GET /asesoria/1/edit
  def edit
    @asesorium = Asesorium.find(params[:id])
  end

  # POST /asesoria
  # POST /asesoria.json
  def create
    session[:asesorium_params].deep_merge!(params[:asesorium]) if params[:asesorium]
    @params = session[:asesorium_params]
    @asesorium = Asesorium.new(session[:asesorium_params])
    @asesorium.current_step = session[:asesorium_step]
    if @asesorium.valid?
      if params[:previous_button]
        @asesorium.previous_step
      elsif @asesorium.last_step?
        @asesorium.save
      else
        @asesorium.next_step
      end
      session[:asesorium_step] = @asesorium.current_step
    end
    
    if @asesorium.new_record?
      render 'new'
    else
      session[:asesorium_step] = nil
      session[:asesorium_params] ||= {}
      redirect_to ver_comprobante_path(@asesorium)
    end
  end

  # PUT /asesoria/1
  # PUT /asesoria/1.json
  def update
    @asesorium = Asesorium.find(params[:id])

    respond_to do |format|
      if @asesorium.update_attributes(params[:asesorium])
        format.html { redirect_to @asesorium, notice: 'Asesorium was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @asesorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asesoria/1
  # DELETE /asesoria/1.json
  def destroy
    @asesorium = Asesorium.find(params[:id])
    @asesorium.destroy

    respond_to do |format|
      format.html { redirect_to asesoria_url }
      format.json { head :ok }
    end
  end
  
  def ver_comprobante
    @asesorium = Asesorium.find(params[:id])
  end
end
