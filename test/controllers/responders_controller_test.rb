require "test_helper"

class RespondersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get responders_index_url
    assert_response :success
  end

  test "should get show" do
    get responders_show_url
    assert_response :success
  end

  test "should get update" do
    get responders_update_url
    assert_response :success
  end
end
