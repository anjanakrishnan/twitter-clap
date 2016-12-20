class TweetsController < ApplicationController

	
	def new
    @newtweet = Tweet.new
  end

  def show  		
  	
  end
  
  def index
    @new_tweets = Tweet.where(:user_id => current_user.id).reverse
  end
  def create
    
      check = params[:autoretweet]
      if check.nil?
  	    @tweet = Tweet.new(twitter_params)
  	    @tweet.user_id = current_user.id 
  	    @tweet.save
      else
        @tweet = Tweet.new(twitter_params)
        @tweet.user_id = current_user.id 
        @tweet.save
        msg = Tweet.maximum('message')
        @role = User.where(:company_id => current_user.company_id, :role => "user")
        @role.each do |t|
          @tweet_user = Tweet.new
          @tweet_user.user_id = t.id
          @tweet_user.message = msg
          @tweet_user.save
        end
      end
    redirect_to root_path
  end
  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
