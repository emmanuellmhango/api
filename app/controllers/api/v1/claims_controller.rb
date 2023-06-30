class Api::V1::ClaimsController < ApplicationController
  before_action :set_api_v1_claim, only: %i[ show update destroy ]

  # GET /api/v1/claims
  # GET /api/v1/claims.json
  def index
    @api_v1_claims = Api::V1::Claim.all
  end

  # GET /api/v1/claims/1
  # GET /api/v1/claims/1.json
  def show
  end

  # POST /api/v1/claims
  # POST /api/v1/claims.json
  def create
    @api_v1_claim = Api::V1::Claim.new(api_v1_claim_params)

    if @api_v1_claim.save
      render :show, status: :created, location: @api_v1_claim
    else
      render json: @api_v1_claim.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/claims/1
  # PATCH/PUT /api/v1/claims/1.json
  def update
    if @api_v1_claim.update(api_v1_claim_params)
      render :show, status: :ok, location: @api_v1_claim
    else
      render json: @api_v1_claim.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/claims/1
  # DELETE /api/v1/claims/1.json
  def destroy
    @api_v1_claim.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_claim
      @api_v1_claim = Api::V1::Claim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_claim_params
      params.require(:api_v1_claim).permit(:img_one, :img_two, :comment, :location, :forwarded, :user_id, :client_id, :category_id)
    end
end
