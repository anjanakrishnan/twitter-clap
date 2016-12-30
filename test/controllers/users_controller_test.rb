require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
 
	def setup

    @company =Company.new(name: 'companyexample')
		@user = User.new(email: 'user@example.com', company_id:@company.id ,role: 'user', password: "123456")
    @unsucessfuluser = User.new(email: '', company_id:@company.id ,role: 'user', password: "123456")
	end

  test "successful login of confirmed user" do
   
    sign_in(user: @user)
    get root_url
    assert_response(:success , message='sucess')
    
  end

  test "unsuccessful login of confirmed user" do
   
    sign_in(user: @unsucessfuluser)
    get root_url
    assert_response(200)
    
  end

end
