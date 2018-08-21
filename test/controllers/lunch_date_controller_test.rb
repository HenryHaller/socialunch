require 'test_helper'

class LunchDateControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lunch_date_show_url
    assert_response :success
  end

end
