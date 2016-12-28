require 'test_helper'

class RoutesTest < ActionController::TestCase
  test "route test" do
   
    assert_generates "/", :controller => "static_pages", :action => "index"
  end
test "sign out test" do
   
    assert_generates "/users/sign_out", :controller => "devise/sessions", :action => "destroy"
  end
end