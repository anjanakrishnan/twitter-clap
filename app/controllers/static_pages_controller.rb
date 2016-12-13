class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      @user = User.all
      @new_tweets = Tweet.where(:user_id => current_user.id).reverse 
    end
    @company = Company.new
    @user = User.new
  end

  def home
  end

  def help
  end
end

