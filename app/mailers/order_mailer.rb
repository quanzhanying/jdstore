class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore]感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
  end

  def notify_order_cancell(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: "admin_email", subject: "[JDstore]取消订单申请中，你确定不要了？🙅 #{order.token}")
  end

  def notify_order_admin_cancell(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore]本次订单已取消，你确定不要了？🙅 #{order.token}")
  end

  def notify_admin_order_shipping(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore]您的订单正在货运中 #{order.token}")
  end

  def notify_order_shipped(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore]您的商品已到货！ #{order.token}")
  end

  def notify_require_return_good(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore]收到您的退货申请，正在处理中。。。 #{order.token}")
    end
  end
