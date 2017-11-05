class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "JDstore感谢您完成本次下单，以下是您本次购物明细 #{order.token}")
  end
end
