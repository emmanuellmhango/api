class Api::V1::UserManagementsController < ApplicationController
  before_action :set_api_v1_user_management, only: %i[ show update destroy ]

  # GET /api/v1/user_managements
  # GET /api/v1/user_managements.json
  def index
    begin
      @api_v1_user_managements = UserManagement.all

      if @api_v1_user_managements?.present
        render json: { success: true, userClients: @api_v1_user_managements }
      else
        render json: { success: false, error: "Clients Users" }
      end
    rescue StandardError => e
      render json: { code: 201, error: e.message }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/user_managements/1
  # GET /api/v1/user_managements/1.json
  def show
  end

  # POST /api/v1/user_managements
  # POST /api/v1/user_managements.json
  def create
    @api_v1_user_management = UserManagement.new(api_v1_user_management_params)

    if @api_v1_user_management.save
      updated_data = UserManagement.all
      render json: {success: true, userClients: updated_data}
    else
      render json: @api_v1_user_management.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/user_managements/1
  # PATCH/PUT /api/v1/user_managements/1.json
  def update
    if @api_v1_user_management.update(api_v1_user_management_params)
      render :show, status: :ok, location: @api_v1_user_management
    else
      render json: @api_v1_user_management.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/user_managements/1
  # DELETE /api/v1/user_managements/1.json
  def destroy
    @api_v1_user_management.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_user_management
      @api_v1_user_management = Api::V1::UserManagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_user_management_params
      params.require(:api_v1_user_management).permit(:company_name, :username, :email, :phone, :social_link, :package)
    end
end
