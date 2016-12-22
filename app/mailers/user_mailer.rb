class UserMailer < ApplicationMailer

    default from: 'twitterclap@gmail.com'
 
  def welcome_email(user,hash)
    @user = user
    @hash = hash
    
    @url  = 'https://agile-everglades-78765.herokuapp.com/'+@hash
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
