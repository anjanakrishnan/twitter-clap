class TweetsController < ApplicationController
	def new
    @new_tweets = Tweet.new
    @tweet = Tweet.new
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
        last_id = Tweet.maximum('tweet_id')

        @role = User.where(:company_id => current_user.company_id, :role => "user")
        @role.each do |t|
          @tweet_user = TweetsUser.new
          @tweet_user.user_id = t.id
          @tweet_user.tweet_id = last_id
          @tweet_user.save
        end
      end
    redirect_to root_url
  end

  def destroy
    
    @role = User.where(:company_id => current_user.company_id, :role => "user")
     @role.each do |t|
       User.destroy(t.id)
     end
    User.destroy(params[:id])
    redirect_to root_url
 end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
