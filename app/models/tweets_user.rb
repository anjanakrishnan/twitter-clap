class TweetsUser < ApplicationRecord

	has_many :user 
	belongs_to :tweet
	validates :user_id, :message, presence: true, autoretweet: false
  before_create :post_to_twitter

  def post_to_twitter
  	user.twitter.update(message)
  end
end
