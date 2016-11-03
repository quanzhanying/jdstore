class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore]感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
  end

  def notify_order_cancelled(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore]订单取消成功，以下是您这次购物明细 #{order.token}")
  end

  def notify_order_ship(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore]订单出货成功，以下是这次购物明细 #{order.token}")
  end

end
