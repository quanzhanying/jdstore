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
end
