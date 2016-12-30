require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

	test "invite" do
   	new_user = User.new(email: "me@example.com", company_id: "7", role: "user", password: "123456789")
 		hash = Digest::SHA512.hexdigest("7")
    email = UserMailer.welcome_email(new_user,hash)
 		assert_emails 1 do
    	email.deliver_now
  	end
    
  end
  
end
