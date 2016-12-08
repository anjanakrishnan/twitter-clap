class StaticPagesController < ApplicationController
  def index
    @user = User.new
    if user_signed_in?
     @user = User.all
      @twitter=Tweet.where(:user_id => current_user.id).reverse
    end

    @tweet=Tweet.new
   
  end

  def home
  end

  def help
  end
end

