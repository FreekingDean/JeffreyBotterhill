require 'test_helper'

class ApiClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_client = api_clients(:one)
  end

  test "should get index" do
    get api_clients_url, as: :json
    assert_response :success
  end

  test "should create api_client" do
    assert_difference('ApiClient.count') do
      post api_clients_url, params: { api_client: { name: @api_client.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_client" do
    get api_client_url(@api_client), as: :json
    assert_response :success
  end

  test "should update api_client" do
    patch api_client_url(@api_client), params: { api_client: { name: @api_client.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_client" do
    assert_difference('ApiClient.count', -1) do
      delete api_client_url(@api_client), as: :json
    end

    assert_response 204
  end
end
