class UsersController < ApplicationController

 def index
   @email = User.new
 end

 def email
 end

 def create
 end

  private
    def email_params
      params.require(:user).permit(:user_email)
    end
end
