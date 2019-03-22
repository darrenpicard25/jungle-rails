class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(user)
    @user = user
    puts "Hello there my email is #{@user.email}"
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
