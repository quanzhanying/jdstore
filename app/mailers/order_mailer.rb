class OrderMailer < ApplicationMailer

  def notify_paid(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次的下单，一下是您这次购物明细#{order.token}")
  end

  def notify_ship(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDStore] 订单运送通知。")
  end

  def notify_admin_cancel(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDStore] 订单取消通知。")
  end

  def notify_cancel(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists
    mail(to: "admin@email", subject: "[JDStore] 订单取消请求。")
  end




end
