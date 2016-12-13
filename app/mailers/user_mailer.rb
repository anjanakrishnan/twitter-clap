class UserMailer < ApplicationMailer
   default from: "anjanakrish.p@gmail.com"

 def welcome_email(user)
    @email = user
    @url  = 'http://example.com/login'
    mail(to: @email.user_email, subject: 'Welcome to My Awesome Site')
  end
end
