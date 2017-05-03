class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order     = order
    @user      = order.user
    @product_lists = order.product_lists

    mail(to: @user.email , subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
  end

  def notify_order_cancel_require(order)
    @order = order
    @user  = order.user
    @product_lists = order.product_lists

    mail(to: 'admin@jdstore.com' , subject: " #{order.user.email} 申请取消订单 #{order.token},以下是订单明细。")
  end

  def notify_order_cancelled(order)
    @order = order
    @user  = order.user
    @product_lists = order.product_lists

    mail(to: @user.email , subject: " 订单 #{order.token}已取消,以下是订单明细。")
  end

  def notify_order_shipping(order)
    @order = order
    @user  = order.user
    @product_lists = order.product_lists

    mail(to: @user.email , subject: " 订单 #{order.token}已出货,以下是订单明细。")
  end
end
