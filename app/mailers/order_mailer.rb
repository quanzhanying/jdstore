class OrderMailer < ApplicationMailer

  # 提示购物明细
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]感谢您完成本次下单，以下是您的购物明晰 #{order.token}")
  end

  # 提示发货
  def notify_shipping(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]您的订单 #{order.token} 已发货，请注意查收")
  end

  # 提示用户申请取消
  def notify_cancell_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: 'admin@jdstore.com', subject:"[JDStore]请求退订 #{order.token}")
  end

  # 提示管理员取消
  def notify_admin_cancell_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]您的订单 #{order.token} 已经被退订")
  end


end
