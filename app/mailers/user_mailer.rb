class UserMailer < ApplicationMailer

    default from: 'twitterclap@gmail.com'
 
  def welcome_email(user,hash)
    @user = user
    @hash = hash
    
    @url  = 'https://hidden-shelf-11165.herokuapp.com/'+@hash
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
