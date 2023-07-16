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



  def index_for_mobile
    begin
      @api_v1_claims = Claim.where(user_id: params[:user_id])
      if @api_v1_claims.present?
        render json: { success: true, claims: @api_v1_claims.as_json(include: :images).merge(
          images: @api_v1_claims.images.map do |image|
            url_for(image)
          end
        ) }
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
    @api_v1_claim = Claim.new(api_v1_claim_params.except(:images))

    images = params[:claim][:images]

    if images
      images.each do |image|
        @api_v1_claim.images.attach(image)
      end
    end

    if @api_v1_claim.save
      updated_claims = Claim.where(user_id: @api_v1_claim.user_id)
      render json: { success: true, claims: updated_claims.as_json(include: :images).merge(
          images: updated_claims.images.map do |image|
            url_for(image)
          end
        ) }
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
      @api_v1_claim = Claim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_claim_params
      params.require(:claim).permit(:comment, :location, :forwarded, :user_id, :category_id, images: [])
    end
end
