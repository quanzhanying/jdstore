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

    mail(to: @user.email, subject: "[JDstore] 你已经提交取消申请，请耐心等待商家确认！ #{@order.token}")
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
