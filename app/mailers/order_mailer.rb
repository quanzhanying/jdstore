class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order  = order
    @user   = @order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次下单，以下是您的购物明细 #{@order.token}")
  end

  def notify_order_cancelled(order)
    @order  = order
    @user   = @order.user
    @product_lists = @order.product_lists

    mail(to: "service@jdstore.com", subject: "[JDStore] 用户#{@order.user.email}已取消订单,点击查看订单详情 #{@order.token}")
  end

  def notify_order_shipping(order)
    @order  = order
    @user   = @order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单已发货，感谢你的支持。 #{@order.token}")
  end

  def notify_order_cancelled_by_admin(order)
    @order = order
    @user  = @order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]您的订单#{order.token}已取消")
  end
end
