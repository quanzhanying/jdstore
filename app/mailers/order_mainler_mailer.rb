class OrderMainlerMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to:@user.email, subject:"[JDStore] 感谢你完成本次订单，以下是你这次购物明细 #{order.token}")
  end

  def notify_order_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to:'service@jdstore.com', subject:"[JDStore] 用户订单取消 #{order.token}")
  end

end
