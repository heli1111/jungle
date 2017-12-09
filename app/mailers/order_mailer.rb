class OrderMailer < ApplicationMailer

  def receipt_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Jungle: receipt for order #' + @order.id.to_s)
  end
end
