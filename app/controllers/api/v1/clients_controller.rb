class Api::V1::ClientsController < ApplicationController
  before_action :set_api_v1_client, only: %i[ show update destroy ]

  # GET /api/v1/clients
  # GET /api/v1/clients.json
  def index
    begin
      @api_v1_clients = Client.all
      if @api_v1_clients.present?
        render json: {success: true, clients: ClientSerializer.new(@api_v1_clients).serializable_hash[:data].map{|hash| hash[:attributes]}}
      else
        render json: { success: false, error: "No clients found." }
      end
    rescue => e
      render json: { code: 201, error: e.message }, status: :unprocessable_entity
    end
  end


  # GET /api/v1/clients/1
  # GET /api/v1/clients/1.json
  def show
  end

  # POST /api/v1/clients
  # POST /api/v1/clients.json
  def create
    @api_v1_client = Client.new(api_v1_client_params)

    if @api_v1_client.save
      @clients = Client.all
      render json: { success: true, clients: @clients }
    else
      render json: @api_v1_client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/clients/1
  # PATCH/PUT /api/v1/clients/1.json
  def update
    if @api_v1_client.update(api_v1_client_params)
      render json: { success: true }
    else
      render json: @api_v1_client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/clients/1
  # DELETE /api/v1/clients/1.json
  def destroy
    if @api_v1_client.destroy
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_client
      @api_v1_client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_client_params
      params.require(:client).permit(:name, :email, :phone, :icon)
    end
end
