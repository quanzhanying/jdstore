class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次的下单，以下是您这词购物的明细 #{order.token}")
  end

  def notify_order_cancelled(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDStore] 敢取消我的单，以下是您这词购物的明细 #{order.token}")
  end

  def notify_cancell_applied(order)
    @order = order
    @product_lists = @order.product_lists
    mail(to: "admin@1", subject: "申请取消订单#{order.token}")
  end
end
