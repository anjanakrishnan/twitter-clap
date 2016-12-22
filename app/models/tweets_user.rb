class TweetsUser < ApplicationRecord
  belongs_to :user 

  validates :user_id, :tweet_id, presence: true ,autoretweet: false

  before_create :post_to_twitter

  def post_to_twitter
    user.twitter.retweet(tweet_id)
  end
end
