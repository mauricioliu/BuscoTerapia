class TerapiasController < ApplicationController
  # GET /terapias
  # GET /terapias.json
  def index
    @search = Terapia.search(params[:search])
    @terapias = @search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terapias }
    end
  end

  # GET /terapias/1
  # GET /terapias/1.json
  def show
    @terapia = Terapia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @terapia }
    end
  end

  # GET /terapias/new
  # GET /terapias/new.json
  def new
    @terapia = Terapia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @terapia }
    end
  end

  # GET /terapias/1/edit
  def edit
    @terapia = Terapia.find(params[:id])
  end

  # POST /terapias
  # POST /terapias.json
  def create
    @terapia = Terapia.new(params[:terapia])

    respond_to do |format|
      if @terapia.save
        format.html { redirect_to @terapia, notice: 'Terapia fue creada exitosamente.' }
        format.json { render json: @terapia, status: :created, location: @terapia }
      else
        format.html { render action: "new" }
        format.json { render json: @terapia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terapias/1
  # PUT /terapias/1.json
  def update
    @terapia = Terapia.find(params[:id])

    respond_to do |format|
      if @terapia.update_attributes(params[:terapia])
        format.html { redirect_to @terapia, notice: 'Terapia fue modificada exitosamente.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @terapia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terapias/1
  # DELETE /terapias/1.json
  def destroy
    @terapia = Terapia.find(params[:id])
    @terapia.destroy

    respond_to do |format|
      format.html { redirect_to terapias_url }
      format.json { head :ok }
    end
  end
end
