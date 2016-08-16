class OrderMailer < ApplicationMailer

  def notify_order_placed(order)
    @order      = order
    @user       = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次的下单，以下是您这次购买明细 #{order.token}")
  end

  def notify_order_cancelled(order)
    @order      = order
    @product_lists = @order.product_lists

    mail(to: "123@123", subject: "[JDStore] 用户申请取消订单 #{order.token}")
  end

end
