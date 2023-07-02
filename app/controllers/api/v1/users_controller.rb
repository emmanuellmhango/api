class Api::V1::UsersController < ApplicationController
  before_action :set_api_v1_user, only: %i[ show update destroy ]
  
  # GET /api/v1/users
  # GET /api/v1/users.json
  def index
    begin
      @api_v1_users = User.find_by(email: params[:email], password: params[:password])
      if @api_v1_users.present?
        render json: { success: true, user: @api_v1_users }
      else
        render json: { success: false }
      end
    rescue StandardError => e
      render json: { code: 201, message: e.message }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/users/1
  # GET /api/v1/users/1.json
  def show
  end

  # POST /api/v1/users
  # POST /api/v1/users.json
  def create
    @api_v1_user = User.new(api_v1_user_params)

    if @api_v1_user.save
      render json: { status: 'Registration is successful', code: 2200 }
    else
      render json: @api_v1_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  # PATCH/PUT /api/v1/users/1.json
  def update
    if @api_v1_user.update(api_v1_user_params)
      render :show, status: :ok
    else
      render json: @api_v1_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  # DELETE /api/v1/users/1.json
  def destroy
    @api_v1_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_user
      @api_v1_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_user_params
      params.require(:user).permit(:name, :email, :password, :phone, :dob)
    end
end
