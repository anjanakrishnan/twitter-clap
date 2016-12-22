class Retweet < ApplicationRecord
  belongs_to :user
  
  before_create :post_to_twitter

  def post_to_twitter
    user.twitter.retweet(tweet_id)
  end
end
