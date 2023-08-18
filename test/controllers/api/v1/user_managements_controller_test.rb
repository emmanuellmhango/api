require "test_helper"

class Api::V1::UserManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_user_management = api_v1_user_managements(:one)
  end

  test "should get index" do
    get api_v1_user_managements_url, as: :json
    assert_response :success
  end

  test "should create api_v1_user_management" do
    assert_difference("Api::V1::UserManagement.count") do
      post api_v1_user_managements_url, params: { api_v1_user_management: { company_name: @api_v1_user_management.company_name, email: @api_v1_user_management.email, package: @api_v1_user_management.package, password: @api_v1_user_management.password, phone: @api_v1_user_management.phone, social_link: @api_v1_user_management.social_link, username: @api_v1_user_management.username } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_user_management" do
    get api_v1_user_management_url(@api_v1_user_management), as: :json
    assert_response :success
  end

  test "should update api_v1_user_management" do
    patch api_v1_user_management_url(@api_v1_user_management), params: { api_v1_user_management: { company_name: @api_v1_user_management.company_name, email: @api_v1_user_management.email, package: @api_v1_user_management.package, password: @api_v1_user_management.password, phone: @api_v1_user_management.phone, social_link: @api_v1_user_management.social_link, username: @api_v1_user_management.username } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_user_management" do
    assert_difference("Api::V1::UserManagement.count", -1) do
      delete api_v1_user_management_url(@api_v1_user_management), as: :json
    end

    assert_response :no_content
  end
end
