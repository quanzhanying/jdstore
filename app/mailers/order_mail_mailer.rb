class OrderMailMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = @order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore]感谢您完成本次的下单，以下是购物明细 #{order.token}")
  end
end
