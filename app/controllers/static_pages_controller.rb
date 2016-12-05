class StaticPagesController < ApplicationController
  def index
    @user = User.new
    if user_signed_in?
     @user = User.all  
    end
    
  end
end