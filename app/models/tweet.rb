class Tweet < ApplicationRecord

  belongs_to :user

	validates :user_id, :message, presence: true ,autoretweet: false

  after_create :post_to_twitter

  def post_to_twitter
  	user.twitter.update(message)
  end
end
