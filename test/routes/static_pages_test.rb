require 'minitest_helper'

describe "Staticpage Route Acceptance Test" do
  it "resolves the staticpage" do
    assert_routing "/", :controller => "static_pages", :action => "index"
  end
end

