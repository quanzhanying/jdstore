class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = Order
    @user = User
    @product_lists = @order.product_lists

    mail(to: @user.email,subject:"[JDStore]感谢您完成本次的下单，以下是您这次的购物明细#{order.token}")
  end 
end
