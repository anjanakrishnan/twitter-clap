require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@company = companies(:one)
   @user = users(:one)
  end

  test "should get index" do
    get :/
    assert_response :success
  end

  test "presence of company" do
    @com = Company.new(name: 'red')
    @user = users(:one)
    get root_url
    assert_response(200)
  end

  test "should create company" do
    assert_no_difference('Company.count') do
     post company_path, params: {company:{name: ""}}
    end
   assert_template 'static_pages/admin'
  end
end