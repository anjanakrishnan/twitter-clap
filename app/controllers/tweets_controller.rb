class TweetsController < ApplicationController

	respond_to :html
	def new
		
  end
  def show  		
  	respond_with(@tweet)
  end
  def index
  	@twitters = Tweet.new
  	@tweet = Tweet.new
    
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

  def tweet
  end
  def twitter
  end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end



end
