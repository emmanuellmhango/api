class Api::V1::ClaimsController < ApplicationController
  before_action :set_api_v1_claim, only: %i[ show update destroy ]

 # GET /api/v1/claims
  # GET /api/v1/claims.json
  def index
    begin
      @api_v1_claims = Claim.includes(:category).with_attached_images.all
      if @api_v1_claims.present?
        claims_with_images = @api_v1_claims.map do |claim|
          {
            id: claim.id,
            comment: claim.comment,
            location: claim.location,
            forwarded: claim.forwarded,
            user_id: claim.user_id,
            category_id: claim.category_id,
            created_at: claim.created_at,
            updated_at: claim.updated_at,
            geocode: claim.geocode,
            category: claim.category.as_json(only: :name),
            images: claim.images.attached? ? claim.images.map { |image| url_for(image) } : []
          }
        end

        render json: { success: true, claims: claims_with_images }
      else
        render json: { success: false, error: "No claims for this user" }
      end
    rescue StandardError => e
      render json: { code: 201, error: e.message }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/claims_group_by_category_id
  def claims_group_by_category_id
    begin
      claims = Claim.all
      if claims.present?
        grouped_claims = claims.group_by(&:category_id)
        result = {}
        grouped_claims.each do |category_id, claims|
          result[category_id] = claims.count
        end
        render json: {success: true, claims: result}
      else
        render json: { success: false, error: "No claims found" }
      end
    rescue StandardError => e
      render json: { code: 201, error: e.message }, status: :unprocessable_entity
    end
  end  
  
  # GET /api/v1/claims_group_by_tags_in_progress
  def claims_group_by_tags_in_progress
    begin
      claims = Claim.where(forwarded: 'false')
      if claims.present?
        grouped_claims = claims.group_by(&:category_id)
        result = {}
        grouped_claims.each do |category_id, claims|
          result[category_id] = claims.count
        end
        render json: { claims: result }
      else
        render json: { success: false, error: "No claims found" }
      end
    rescue => exception
      render json: { code: 201, error: exception.message }, status: :unprocessable_entity
    end
  end  
  
  # GET /api/v1/claims_group_by_tags_fixed
  def claims_group_by_tags_fixed
    begin
      claims = Claim.where(fixed: false)
      if claims.present?
        grouped_claims = claims.group_by(&:category_id)
        result = {}
        grouped_claims.each do |category_id, claims|
          result[category_id] = claims.count
        end

        render json: { claims: result }
      else
        render json: { success: false, error: "No claims found" }
      end
    rescue => exception
      render json: { code: 201, error: exception.message }, status: :unprocessable_entity
    end
  end

  
  # GET /api/v1/claims_for_mobile Individual results for the user
  def index_for_mobile
    begin
      @api_v1_claims = Claim.includes(:category).where(user_id: params[:user_id]).with_attached_images.all
      if @api_v1_claims.present?
        claims_with_images = @api_v1_claims.map do |claim|
          {
            id: claim.id,
            comment: claim.comment,
            location: claim.location,
            forwarded: claim.forwarded,
            user_id: claim.user_id,
            category_id: claim.category_id,
            created_at: claim.created_at,
            updated_at: claim.updated_at,
            geocode: claim.geocode,
            category: claim.category.as_json(only: :name),
            images: claim.images.attached? ? claim.images.map { |image| url_for(image) } : []
          }
        end

        render json: { success: true, claims: claims_with_images }
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
      render json: { success: true }
    else
      render json: @api_v1_claim.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /api/v1/claims/1
  # PATCH/PUT /api/v1/claims/1.json
  def update
    if @api_v1_claim.update(api_v1_claim_params)
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  # DELETE /api/v1/claims/1
  # DELETE /api/v1/claims/1.json
  def destroy
    if @api_v1_claim.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_claim
      @api_v1_claim = Claim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_claim_params
      params.require(:claim).permit(:comment, :location, :forwarded, :user_id, :category_id, :geocode, images: [])
    end

end
