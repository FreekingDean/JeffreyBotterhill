require 'test_helper'

class BlurbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blurb = blurbs(:one)
  end

  test "should get index" do
    get blurbs_url, as: :json
    assert_response :success
  end

  test "should create blurb" do
    assert_difference('Blurb.count') do
      post blurbs_url, params: { blurb: { message: @blurb.message, metadata: @blurb.metadata, source: @blurb.source, type: @blurb.type } }, as: :json
    end

    assert_response 201
  end

  test "should show blurb" do
    get blurb_url(@blurb), as: :json
    assert_response :success
  end

  test "should update blurb" do
    patch blurb_url(@blurb), params: { blurb: { message: @blurb.message, metadata: @blurb.metadata, source: @blurb.source, type: @blurb.type } }, as: :json
    assert_response 200
  end

  test "should destroy blurb" do
    assert_difference('Blurb.count', -1) do
      delete blurb_url(@blurb), as: :json
    end

    assert_response 204
  end
end
