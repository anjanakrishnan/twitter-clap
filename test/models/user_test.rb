require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
    @user = User.new(email: "user@example.com", name: "Joe",
      provider: "twitter",uid: "803472843681865728", company_id: "7", role: "admin",
    	token: "803472843681865728-Cfiz4gyBN2b39AFUKDUcXK333WOtzDW",
    	secret: "6FWK6qo99SarcPPsjqkhiLkkIwQa5wYOZKJJdkdoN2vKi", 
    	profile_image_url: "http://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png", 
    	encrypted_password: "$2a$11$3Ww8IvpZgX5YlVH7xVqi3.hslbEb9JU.DtStZEuptUiIy7XgLeK1K",
      password: "rajanakk" )
  end

  
  test "email invalidation" do
    invalid_addresses = %w[user@example user_at_foo.org]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert @user.invalid?, "#{invalid_address.inspect} should be invalid"
    end
  end


  test "email validation" do
    valid_addresses = %w[user@example.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end


  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  # test "the truth" do
  #   assert true
  # end
end
