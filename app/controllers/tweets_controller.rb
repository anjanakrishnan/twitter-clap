class TweetsController < ApplicationController

	respond_to :html
	def new
    @newtweet = Tweet.new
  end

  def show  		
  	respond_with(@tweet)
  end
  
  def index
    @new_tweets = Tweet.where(:user_id => current_user.id).reverse
   # @twitter=Tweet.where(:user_id => current_user.id)
  end
  def create
  	@tweet = Tweet.new(twitter_params)
  	@tweet.user_id = current_user.id 
  	@tweet.save
  	respond_with(@tweet)
  	#redirect_to root_path
    #current_user.tweet(twitter_params[:message])
  end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
