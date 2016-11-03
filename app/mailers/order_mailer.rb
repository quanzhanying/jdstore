class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[KStore]Thanks for ordering. This is your order information. #{order.token}")
  end

  def notify_order_cancelled(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[KStore]You've can")

end
