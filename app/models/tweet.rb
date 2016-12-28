class Tweet < ApplicationRecord
  belongs_to :user

#	validates :user_id, :message, presence: true ,autoretweet: false

  after_create :post_to_twitter

  def post_to_twitter
  	value = user.twitter.update(message)
    last_id = Tweet.maximum('id')
    @tweet = Tweet.where(:id => last_id)
    @tweet.update(:tweet_id => value.id)
  end
end
