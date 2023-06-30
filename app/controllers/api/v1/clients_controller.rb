class Api::V1::ClientsController < ApplicationController
  before_action :set_api_v1_client, only: %i[ show update destroy ]

  # GET /api/v1/clients
  # GET /api/v1/clients.json
  def index
    @api_v1_clients = Api::V1::Client.all
  end

  # GET /api/v1/clients/1
  # GET /api/v1/clients/1.json
  def show
  end

  # POST /api/v1/clients
  # POST /api/v1/clients.json
  def create
    @api_v1_client = Api::V1::Client.new(api_v1_client_params)

    if @api_v1_client.save
      render :show, status: :created, location: @api_v1_client
    else
      render json: @api_v1_client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/clients/1
  # PATCH/PUT /api/v1/clients/1.json
  def update
    if @api_v1_client.update(api_v1_client_params)
      render :show, status: :ok, location: @api_v1_client
    else
      render json: @api_v1_client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/clients/1
  # DELETE /api/v1/clients/1.json
  def destroy
    @api_v1_client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_client
      @api_v1_client = Api::V1::Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_client_params
      params.require(:api_v1_client).permit(:name, :icon, :email, :phone)
    end
end
