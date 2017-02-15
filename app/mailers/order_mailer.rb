class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email , subject: "[JDstore] Thanks for your order, below are your order information.  #{order.token}")
  end

end
