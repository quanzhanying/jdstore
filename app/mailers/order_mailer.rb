class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subjects: "[Michael's Store] Thank you for shopping at Michael's. We have received your order, here is your order detail #{order.token} ")
    
  end
end
