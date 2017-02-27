class OrderMailer < ApplicationMailer
  def notify_order_placed(order, chef)
    @order = order
    @chef = chef
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
  end

  def apply_cancel(order, chef)
    @order = order
    @chef = chef
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com", subject: "[JDstore] 用户#{order.user.email}申请取消订单 #{order.token}")
  end

  def apply_return(order, chef)
    @order = order
    @chef = chef
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com", subject: "[JDstore] 用户#{order.user.email}申请退货 #{order.token}")
  end

  def notify_ship(order, chef)
    @order        = order
    @chef = chef
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已发货")
  end

  def notify_cancel(order, chef)
    @order        = order
    @chef = chef
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已取消")
  end
end
