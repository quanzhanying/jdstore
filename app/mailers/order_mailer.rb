class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order     = order
    @user      = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[RebeccaStore] 感谢你完成本次下单，以下是你的购物明细 #{order.token}")
  end

  def notify_order_cancelled(order)
    @order     = order
    @user      = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[RebeccaStore] 你的订单已经被取消 #{order.token}")
  end

  def notify_shipping(order)
    @order     = order
    @user      = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[RebeccaStore] 你的订单已经发货，请耐心等待 #{order.token}")
  end
end
