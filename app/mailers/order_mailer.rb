class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次的下单，一下是您这次购物明细 #{order.token}")
  end

  def apply_cancel_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@jdstore.com", subject: "[JDStore] #{@user.email} 申请取消订单 #{order.token}")
  end

  def admin_cancel_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单号为 #{order.token} 已被管理员取消")
  end

  def shipping_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单号为 #{order.token} 已经出货")
  end
end
