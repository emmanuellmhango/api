class Api::V1::CategoriesController < ApplicationController
  before_action :set_api_v1_category, only: %i[ show update destroy ]

  # GET /api/v1/categories
  # GET /api/v1/categories.json
  def index
    begin
      @api_v1_categories = Category.all
      if @api_v1_categories.present?
        serialized_categories = CategorySerializer.new(@api_v1_categories).serializable_hash[:data].map { |item| item[:attributes] }
        render json: { status: :ok, success: true, categories: serialized_categories }
      else
        render json: { success: false, error: "No categories found." }
      end
    rescue => e
      render json: { code: 201, error: e.message }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/categories/1
  # GET /api/v1/categories/1.json
  def show
  end

  # GET /api/v1/category_client_email
  def category_client_email
    begin
      @cat_details = Category.includes(:user_management).find_by(name: params[:category_name])

      if @cat_details.present?
        render json: { success: true, details: @cat_details.as_json(include: :user_management) }
      else
        render json: { success: false, error: "No categories found." }
      end
    rescue => e
      render json: { code: 201, error: e.message }, status: :unprocessable_entity
    end
  end


  # POST /api/v1/categories
  # POST /api/v1/categories.json
  def create
    @api_v1_category = Category.new(api_v1_category_params)

    if @api_v1_category.save
      @categories = Category.all
      if @categories.present?
        serial_categories = CategorySerializer.new(@categories).serializable_hash[:data].map { |item| item[:attributes] }
        render json: { success: true, categories: serial_categories }
      else
        render json: { success: false, error: "No categories found." }
      end
    else
      render json: @api_v1_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/categories/1
  # PATCH/PUT /api/v1/categories/1.json
  def update
    if @api_v1_category.update(api_v1_category_params)
      render :show, status: :ok, location: @api_v1_category
    else
      render json: @api_v1_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/categories/1
  # DELETE /api/v1/categories/1.json
  def destroy
    if @api_v1_category.destroy
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_category
      @api_v1_category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_category_params
      params.require(:category).permit(:name, :icon, :description, :user_management_id)
    end
end
