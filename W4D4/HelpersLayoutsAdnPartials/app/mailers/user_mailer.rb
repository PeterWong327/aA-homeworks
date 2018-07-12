class UserMailer < ApplicationMailer
  default from: 'cats@cats.com'

  def welcome_email(user)
    @user = user
    @url = 'http://cats.com/login'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def reminder_email(user)
  end
  
end
