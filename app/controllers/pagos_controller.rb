class PagosController < ApplicationController
  http_basic_authenticate_with :name => "btp", :password => "btp.123!"
  # GET /pagos
  # GET /pagos.json
  def index
    if params[:status] and params[:status] != "pendiente"
      @pagos = Pago.where("estado <> 'pendiente'")
    else
      @pagos = Pago.where("estado = 'pendiente'")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagos }
    end
  end

  # GET /pagos/1
  # GET /pagos/1.json
  def show
    @pago = Pago.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pago }
    end
  end

  # GET /pagos/new
  # GET /pagos/new.json
  def new
    @pago = Pago.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pago }
    end
  end

  # GET /pagos/1/edit
  def edit
    @pago = Pago.find(params[:id])
  end

  # POST /pagos
  # POST /pagos.json
  def create
    @pago = Pago.new(params[:pago])

    respond_to do |format|
      if @pago.save
        format.html { redirect_to @pago, notice: 'Pago was successfully created.' }
        format.json { render json: @pago, status: :created, location: @pago }
      else
        format.html { render action: "new" }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pagos/1
  # PUT /pagos/1.json
  def update
    @pago = Pago.find(params[:id])

    respond_to do |format|
      if @pago.update_attributes(params[:pago])
        format.html { redirect_to @pago, notice: 'Pago was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    @pago = Pago.find(params[:id])
    @pago.destroy

    respond_to do |format|
      format.html { redirect_to pagos_url }
      format.json { head :ok }
    end
  end
  
  def validar_pago
    pago = Pago.find(params[:id])
    pago.estado = "validado manualmente"
    pago.fecha_pago = Time.now
    if pago.tipo = "Suscripcion Completa Anual"
      pago.terapeuta.plan_expira =  1.year.from_now
    elsif pago.tipo = "Suscripcion Completa Semestral"
      pago.terapeuta.plan_expira =  6.month.from_now
    else 
      pago.terapeuta.plan_expira =  3.month.from_now
    end
    pago.terapeuta.save
    pago.save
    redirect_to pagos_path
  end
end
