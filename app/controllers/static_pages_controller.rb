class StaticPagesController < ApplicationController
  def index
    @user = User.new
    if user_signed_in?
     @user = User.all  
    end
    
  end

  def home
  end

  def help
  end
end

