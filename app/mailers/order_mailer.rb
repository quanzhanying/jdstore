class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 感谢你完成的下单，一下是你这次的购物明细 #{order.token}")
  end
end
