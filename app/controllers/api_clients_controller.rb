class ApiClientsController < ApplicationController
  before_action :set_api_client, only: [:show, :update, :destroy]

  # GET /api_clients
  def index
    @api_clients = ApiClient.all

    render json: @api_clients
  end

  # GET /api_clients/1
  def show
    render json: @api_client
  end

  # POST /api_clients
  def create
    @api_client = ApiClient.new(api_client_params)

    if @api_client.save
      render json: @api_client, status: :created, location: @api_client
    else
      render json: @api_client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api_clients/1
  def update
    if @api_client.update(api_client_params)
      render json: @api_client
    else
      render json: @api_client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api_clients/1
  def destroy
    @api_client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_client
      @api_client = ApiClient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_client_params
      params.require(:api_client).permit(:name)
    end
end
