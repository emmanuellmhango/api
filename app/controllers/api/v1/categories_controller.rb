class Api::V1::CategoriesController < ApplicationController
  before_action :set_api_v1_category, only: %i[ show update destroy ]

  # GET /api/v1/categories
  # GET /api/v1/categories.json
  def index
    @api_v1_categories = Api::V1::Category.all
  end

  # GET /api/v1/categories/1
  # GET /api/v1/categories/1.json
  def show
  end

  # POST /api/v1/categories
  # POST /api/v1/categories.json
  def create
    @api_v1_category = Api::V1::Category.new(api_v1_category_params)

    if @api_v1_category.save
      render :show, status: :created, location: @api_v1_category
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
    @api_v1_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_category
      @api_v1_category = Api::V1::Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_category_params
      params.require(:api_v1_category).permit(:name, :icon)
    end
end
