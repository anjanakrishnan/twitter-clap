class UsersController < ApplicationController

 def index
  hash = params[:guid]
  session[:hash_id] = hash
 # current_user.update!(:id_hash => hash)
  redirect_to root_url
 end
 
 def new
  @user = User.new
 end
 
 def create
  @new_user = User.new(:email => email_params[:email], :company_id => email_params[:company_id], :role => email_params[:role], :password => "123456789")
  if @new_user.save
    @user_id = User.maximum('id')
    @admin_id = current_user.id
    hash = Digest::SHA512.hexdigest("#{@user_id}")
    @new_user.update!(id_hash: hash)
    UserMailer.welcome_email(@new_user,hash).deliver_now
    redirect_to root_url
  end
 end

  private
    def email_params
      params.require(:user).permit(:email, :company_id, :role)
    end
end