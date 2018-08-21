require 'test_helper'

class LunchRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lunch_request_new_url
    assert_response :success
  end

  test "should get create" do
    get lunch_request_create_url
    assert_response :success
  end

  test "should get show" do
    get lunch_request_show_url
    assert_response :success
  end

  test "should get destroy" do
    get lunch_request_destroy_url
    assert_response :success
  end

end
