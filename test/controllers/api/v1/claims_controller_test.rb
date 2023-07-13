require "test_helper"

class Api::V1::ClaimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_claim = api_v1_claims(:one)
  end

  test "should get index" do
    get api_v1_claims_url, as: :json
    assert_response :success
  end

  test "should create api_v1_claim" do
    assert_difference("Api::V1::Claim.count") do
      post api_v1_claims_url, params: { api_v1_claim: { category: @api_v1_claim.category, comment: @api_v1_claim.comment, forwarded: @api_v1_claim.forwarded, location: @api_v1_claim.location, user_id: @api_v1_claim.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_claim" do
    get api_v1_claim_url(@api_v1_claim), as: :json
    assert_response :success
  end

  test "should update api_v1_claim" do
    patch api_v1_claim_url(@api_v1_claim), params: { api_v1_claim: { category: @api_v1_claim.category, comment: @api_v1_claim.comment, forwarded: @api_v1_claim.forwarded, location: @api_v1_claim.location, user_id: @api_v1_claim.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_claim" do
    assert_difference("Api::V1::Claim.count", -1) do
      delete api_v1_claim_url(@api_v1_claim), as: :json
    end

    assert_response :no_content
  end
end
