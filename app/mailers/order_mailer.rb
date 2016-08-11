class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次下单，以下是您这次购物明细 #{order.token}")
  end

  def notify_order_cancelled(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "123@123.123", subject: "[JDStore] 有一个客户取消了订单! #{order.token}")
  end
end
