class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists


    mail(to: @user.email, subject: "[JDstore] 感谢您完成本次的订单，以下是购物明细 #{order.token}")
  end

  def notify_order_cancel(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists
    mail(to: @user.email, subject: "[JDstore] 已经申请退货！ #{order.token}")
  end

end
