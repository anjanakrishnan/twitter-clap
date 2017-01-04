require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
 
	def setup
    @user = users(:one)
    @company =Company.new(name: 'companyexample')
		#@user = User.new(email: 'user@example.com', company_id:@company.id ,role: 'user', password: "123456")
    @unsucessful = User.new(email: '', company_id:@company.id ,role: 'user', password: "123456")
	end

  test "successful login of confirmed admin" do
   
    sign_in(user: @user)
    get root_url
    assert_response(:success)
    
  end

  test "unsuccessful login of confirmed admin" do
   
    sign_in(user: @unsucessful)
    get root_url
    assert_response(200)
  end

  
 # test "invalid user email address" do

end
