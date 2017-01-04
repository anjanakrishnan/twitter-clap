class UsersController < ApplicationController

 def index
  hash = params[:guid]
  session[:hash_id] = hash
  redirect_to root_url
 end
 
 def new
  @user = User.new
 end
 
 def create
  if email_params[:email].nil?
  else

    @new_user = User.new(:email => email_params[:email], :company_id => email_params[:company_id], :role => email_params[:role], :password => "123456789")
  if @new_user.save
    @user_id = @new_user.id
    @admin_id = current_user.id
    hash = Digest::SHA512.hexdigest("#{@user_id}")
    @new_user.update!(id_hash: hash)
    UserMailer.welcome_email(@new_user,hash).deliver_now
    redirect_to root_url
  else
    flash[:danger] = "This email is already used"
    redirect_to root_url
  end
 end
end

 def destroy
    User.destroy(params[:id])
    redirect_to root_url
 end
  private
    def email_params
      params.require(:user).permit(:email, :company_id, :role)
    end
end