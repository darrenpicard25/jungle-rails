class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(user, orderinfo)
    @order = orderinfo
    @user = user
    @url  = 'http://example.com'
    mail(to: @user.email, subject: "Order \##{@order.id} from Jungle")
  end

end
