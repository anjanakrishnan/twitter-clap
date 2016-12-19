class UserMailer < ApplicationMailer
    default from: 'twitterclap@gmail.com'
 
  def welcome_email(user,hash)
    @user = user
    @hash = hash
    
    @url  = 'http://localhost:3000/'+@hash
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
