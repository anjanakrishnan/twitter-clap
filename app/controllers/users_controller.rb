class UsersController < ApplicationController

 def index
 end
 
 def new
  @user = User.new
 end
 
 def create
  redirect_to root_url
 end

  private
    def email_params
      params.require(:user).permit(:email)
    end
end
