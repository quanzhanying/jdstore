class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists
    mail(to: @user.email, subject: "[JDstore] Thank you for finshing the order, this is your shopping list #{order.token}")
  end
end
