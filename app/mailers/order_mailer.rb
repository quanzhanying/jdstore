class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{@order.token}")
  end


  def notify_cancelling(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@jdstore.com", subject: "#{@user.email}提交了订单号为 #{@order.token}的撤回请求")
  end

  def notify_delivered(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] 订单已经发货！ #{@order.token}")
  end

  def notify_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] 您提交的订单取消请求已经通过#{@order.token}")
  end

end
