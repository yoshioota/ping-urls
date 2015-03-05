class PingUrlResultsController < ApplicationController
  before_action :set_ping_url_result, only: [:show, :edit, :update, :destroy]

  # GET /ping_url_results
  # GET /ping_url_results.json
  def index
    @ping_url_results = PingUrlResult.all
  end

  # GET /ping_url_results/1
  # GET /ping_url_results/1.json
  def show
  end

  # GET /ping_url_results/new
  def new
    @ping_url_result = PingUrlResult.new
  end

  # GET /ping_url_results/1/edit
  def edit
  end

  # POST /ping_url_results
  # POST /ping_url_results.json
  def create
    @ping_url_result = PingUrlResult.new(ping_url_result_params)

    respond_to do |format|
      if @ping_url_result.save
        format.html { redirect_to @ping_url_result, notice: 'Ping url result was successfully created.' }
        format.json { render :show, status: :created, location: @ping_url_result }
      else
        format.html { render :new }
        format.json { render json: @ping_url_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ping_url_results/1
  # PATCH/PUT /ping_url_results/1.json
  def update
    respond_to do |format|
      if @ping_url_result.update(ping_url_result_params)
        format.html { redirect_to @ping_url_result, notice: 'Ping url result was successfully updated.' }
        format.json { render :show, status: :ok, location: @ping_url_result }
      else
        format.html { render :edit }
        format.json { render json: @ping_url_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ping_url_results/1
  # DELETE /ping_url_results/1.json
  def destroy
    @ping_url_result.destroy
    respond_to do |format|
      format.html { redirect_to ping_url_results_url, notice: 'Ping url result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ping_url_result
      @ping_url_result = PingUrlResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ping_url_result_params
      params.require(:ping_url_result).permit(:ping_url_id, :response_body)
    end
end
