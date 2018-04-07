class HrsController < ApplicationController
  before_action :set_hr, only: [:show, :edit, :update, :destroy]

  # GET /hrs
  # GET /hrs.json
  def index
    @hrs = Hr.all
  end

  # GET /hrs/1
  # GET /hrs/1.json
  def show
  end

  # GET /hrs/new
  def new
    @hr = Hr.new
  end

  # GET /hrs/1/edit
  def edit
  end

  # POST /hrs
  # POST /hrs.json
  def create
    @hr = Hr.new(hr_params)

    respond_to do |format|
      if @hr.save
        format.html { redirect_to @hr, notice: 'Hr was successfully created.' }
        format.json { render :show, status: :created, location: @hr }
      else
        format.html { render :new }
        format.json { render json: @hr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hrs/1
  # PATCH/PUT /hrs/1.json
  def update
    respond_to do |format|
      if @hr.update(hr_params)
        format.html { redirect_to @hr, notice: 'Hr was successfully updated.' }
        format.json { render :show, status: :ok, location: @hr }
      else
        format.html { render :edit }
        format.json { render json: @hr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hrs/1
  # DELETE /hrs/1.json
  def destroy
    @hr.destroy
    respond_to do |format|
      format.html { redirect_to hrs_url, notice: 'Hr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hr
      @hr = Hr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hr_params
      params.fetch(:hr, {})
    end
end
