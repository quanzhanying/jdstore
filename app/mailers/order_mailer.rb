class OrderMailer < ApplicationMailer

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    # mail(to:@user.email, subject:"[JDStore] 感谢你完成本次订单，以下是你这次购物明细 #{order.token}")
  end

  def notify_order_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    # mail(to:"service@jdstore.com", subject:"[JDStore] 用户取消订单  #{order.token}")
  end

  def notify_order_ship(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    # mail(to:@user.email, subject:"[JDStore] 你购买的商品已发货，以下是你这次购物明细  #{order.token}")
  end

  def notify_order_cancel_by_admin(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    # mail(to: @user.email, subject:"[JDStore] 您好，你的订单已被取消  #{order.token}")
  end

end
