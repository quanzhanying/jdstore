class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists

    mail(to: @user.email,subject:"[JDStore] 感谢您完成本次的下单，以下是您这次购物明细#{order.token}")
  end

  def notify_order_cancell_appl(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists

    @admin = User.where(is_admin:true).first

    mail(to: @admin.email,subject:"[JDStore] 申请取消订单，以下是我的购物明细#{order.token}，请批准")
  end

  def notify_cancell_order(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists

    mail(to: @user.email,subject:"[JDStore] 您的订单已取消成功，以下是订单明细#{order.token}")
  end

  def notify_ship(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists

    mail(to: @user.email,subject:"[JDStore] 您的订单已出货，请您注意查收，以下是订单明细#{order.token}")
  end
end
