class UserMailer < ApplicationMailer
    default from: 'nimmy@redpanthers.co'
 
  def welcome_email(user,hash)
    @user = user
    @hash = hash
    
    @url  = 'http://localhost:3000/'+@hash
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
