require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get static_user_url
    assert_response :success
  end

end
