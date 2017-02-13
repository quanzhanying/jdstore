class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email , subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
  end

  def apply_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com", subject: "[JDStore] User#{order.user.email} applied to cancel order #{order.token}")
  end

  def notify_ship(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] Your order #{order.token} has already shipped")
  end

  def notify_cancel(order)
    @order = Order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.eamil, subject:"[JDStore] Your order #{order.token} already cancelled.")
  end
end
