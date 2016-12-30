require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest

	def setup 
   @tweet = Tweet.new(user_id: "1" , message:"hi" ,tweet_id:"29939939")
  end

  test "should get index" do
  	get :/
  	assert_response :success
	end

	test "should route to post" do
  	assert_routing '/tweets/1', { :controller => "tweets", :action => "show", :id => "1" }
	end

 # test "should create tweet" do
 #    assert_difference('Tweet.count') do
 #      post :create, tweet: { user_id: @tweet.user_id, message: @tweet.message , tweet_id:@tweet_id}
 #    end

 #    assert_redirected_to tweets_url
 #  end
end
