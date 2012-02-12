class RefDataController < ApplicationController
  # GET /ref_data
  # GET /ref_data.json
  def index
    @ref_data = RefDatum.page(params[:page]).per_page(25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_data }
    end
  end

  # GET /ref_data/1
  # GET /ref_data/1.json
  def show
    @ref_datum = RefDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_datum }
    end
  end

  # GET /ref_data/new
  # GET /ref_data/new.json
  def new
    @ref_datum = RefDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_datum }
    end
  end

  # GET /ref_data/1/edit
  def edit
    @ref_datum = RefDatum.find(params[:id])
  end

  # POST /ref_data
  # POST /ref_data.json
  def create
    @ref_datum = RefDatum.new(params[:ref_datum])

    respond_to do |format|
      if @ref_datum.save
        format.html { redirect_to @ref_datum, notice: 'Ref datum was successfully created.' }
        format.json { render json: @ref_datum, status: :created, location: @ref_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref_data/1
  # PUT /ref_data/1.json
  def update
    @ref_datum = RefDatum.find(params[:id])

    respond_to do |format|
      if @ref_datum.update_attributes(params[:ref_datum])
        format.html { redirect_to @ref_datum, notice: 'Ref datum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref_data/1
  # DELETE /ref_data/1.json
  def destroy
    @ref_datum = RefDatum.find(params[:id])
    @ref_datum.destroy

    respond_to do |format|
      format.html { redirect_to ref_data_url }
      format.json { head :ok }
    end
  end
end
