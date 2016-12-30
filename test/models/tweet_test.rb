require 'test_helper'

class TweetTest < ActiveSupport::TestCase

	def setup
    @tweet = Tweet.new(user_id:"1", message:"message example", tweet_id:"93993")
  end

	

  # test "the truth" do
  #   assert true
  # end
end
