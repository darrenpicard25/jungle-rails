class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(user, orderinfo)
    @order = orderinfo
    @user = user
    @url  = 'http://example.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
