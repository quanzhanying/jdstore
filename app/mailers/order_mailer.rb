class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email , subject: "[jdstore] 感谢您完成本次下单，以下是您这次的购物明细 #{order.token}")
  end

  def notify_order_canced(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email , subject: "[jdstore] 您已取消本次下单，以下是您这次的购物明细 #{order.token}")

  end
  
  def notify_apply_order_canced(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: service@jdstore.com , subject: "[jdstore] 申请取消本次下单，细 #{order.token}")

  end
end
