class StaticPagesController < ApplicationController
  def index
    
    if user_signed_in?
     @user = User.all
      @twitter=Tweet.where(:user_id => current_user.id).reverse
    end


    @tweet=Tweet.new
   

    @company = Company.new

  end

  def home
  end

  def help
  end


end

