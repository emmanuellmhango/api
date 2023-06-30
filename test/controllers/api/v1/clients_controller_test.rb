require "test_helper"

class Api::V1::ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_client = api_v1_clients(:one)
  end

  test "should get index" do
    get api_v1_clients_url, as: :json
    assert_response :success
  end

  test "should create api_v1_client" do
    assert_difference("Api::V1::Client.count") do
      post api_v1_clients_url, params: { api_v1_client: { email: @api_v1_client.email, icon: @api_v1_client.icon, name: @api_v1_client.name, phone: @api_v1_client.phone } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_client" do
    get api_v1_client_url(@api_v1_client), as: :json
    assert_response :success
  end

  test "should update api_v1_client" do
    patch api_v1_client_url(@api_v1_client), params: { api_v1_client: { email: @api_v1_client.email, icon: @api_v1_client.icon, name: @api_v1_client.name, phone: @api_v1_client.phone } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_client" do
    assert_difference("Api::V1::Client.count", -1) do
      delete api_v1_client_url(@api_v1_client), as: :json
    end

    assert_response :no_content
  end
end
