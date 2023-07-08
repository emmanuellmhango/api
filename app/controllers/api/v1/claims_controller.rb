class Api::V1::ClaimsController < ApplicationController
  before_action :set_api_v1_claim, only: %i[ show update destroy ]

  # GET /api/v1/claims
  # GET /api/v1/claims.json
  def index
  begin
    @api_v1_claims = Claim.includes(:client, :category).all
    if @api_v1_claims.present?
      render json: { success: true, claims: @api_v1_claims.as_json(include: { client: { only: :name }, category: { only: :name } }) }
    else
      render json: { success: false, error: "No claims for this user" }
    end
  rescue StandardError => e
    render json: { code: 201, error: e.message }, status: :unprocessable_entity
  end
end


  def index_for_mobile
    begin
      @api_v1_claims = Claim.where(user_id: params[:user_id])
      if @api_v1_claims.present?
        render json: { success: true, claims: ClaimSerializer.new(@api_v1_claims).serializable_hash[:data].map { |hash| hash[:attributes] }, code: 2201 }
      else
        render json: { success: false, error: "No claims for this user" }
      end
    rescue StandardError => e
      render json: { code: 201, error: e.message }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/claims/1
  # GET /api/v1/claims/1.json
  def show
  end

  # POST /api/v1/claims
  # POST /api/v1/claims.json
  def create
    @api_v1_claim = Claim.new(api_v1_claim_params)

    if @api_v1_claim.save
      updated_claims = Claim.where(user_id: @api_v1_claim.user_id)
      render json: { success: true, claims: ClaimSerializer.new(updated_claims).serializable_hash[:data].map { |hash| hash[:attributes] }, code: 2201 }
    else
      render json: @api_v1_claim.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /api/v1/claims/1
  # PATCH/PUT /api/v1/claims/1.json
  def update
    @api_v1_claim = Claim.find(params[:claim_id])

    if @api_v1_claim.update(forwarded: params[:forwarded])
      render json: { success: true }
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
      @api_v1_claim = Claim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_claim_params
      params.require(:claim).permit(:comment, :location, :forwarded, :user_id, :client_id, :category_id, images: [])
    end
end
