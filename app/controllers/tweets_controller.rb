class TweetsController < ApplicationController

	def new
    @new_tweets = Tweet.new
    @tweet = Tweet.new
  end

  def show  		
  	
  end
  
  def index
    @new_tweets = Tweet.where(:user_id => current_user.id).reverse
   # @twitter=Tweet.where(:user_id => current_user.id)
  end
  def create
  	@tweet = Tweet.new(twitter_params)
    @tweet.autoretweet=params[:autoretweet]
  	@tweet.user_id = current_user.id 
  	@tweet.save
    redirect_to root_url
  end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
