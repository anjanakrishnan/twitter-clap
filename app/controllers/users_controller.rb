class UsersController < ApplicationController

 def index
 end
 
 def new
  @user = User.new
 end
 
 def create
  @user = User.new(email_params)
  @user.save
  UserMailer.welcome_email(@user).deliver_now
  redirect_to root_url
 end

  private
    def email_params
      params.require(:user).permit(:user_email)
    end
end
