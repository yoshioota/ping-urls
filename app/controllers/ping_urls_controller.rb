class PingUrlsController < ApplicationController

  before_action :set_ping_url, only: [:show, :edit, :update, :destroy, :check]

  # GET /ping_urls
  # GET /ping_urls.json
  def index
    @ping_urls = PingUrl.all
  end

  # GET /ping_urls/1
  # GET /ping_urls/1.json
  def show
  end

  # GET /ping_urls/new
  def new
    @ping_url = PingUrl.new
  end

  # GET /ping_urls/1/edit
  def edit
  end

  # POST /ping_urls
  # POST /ping_urls.json
  def create
    @ping_url = PingUrl.new(ping_url_params)

    respond_to do |format|
      if @ping_url.save
        format.html { redirect_to @ping_url, notice: 'Ping url was successfully created.' }
        format.json { render :show, status: :created, location: @ping_url }
      else
        format.html { render :new }
        format.json { render json: @ping_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ping_urls/1
  # PATCH/PUT /ping_urls/1.json
  def update
    respond_to do |format|
      if @ping_url.update(ping_url_params)
        format.html { redirect_to @ping_url, notice: 'Ping url was successfully updated.' }
        format.json { render :show, status: :ok, location: @ping_url }
      else
        format.html { render :edit }
        format.json { render json: @ping_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ping_urls/1
  # DELETE /ping_urls/1.json
  def destroy
    @ping_url.destroy
    respond_to do |format|
      format.html { redirect_to ping_urls_url, notice: 'Ping url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check
    unless HttpUtils.cached?(@ping_url.url)
      @ping_url.ping_url_results.create(response_body: HttpUtils.get(@ping_url.url))
    end
    redirect_to action: :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ping_url
      @ping_url = PingUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ping_url_params
      params.require(:ping_url).permit(:url)
    end
end
