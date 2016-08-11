class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order # What is the order?
    @user = order.user
    @product_lists = order.product_lists

    mail(to: @user.email, subject: "[JD Store] thanks for your order. Order(#{order.token}) details are as follows!")
  end
end
