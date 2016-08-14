class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Knowledage Store]Thank you for shopping,this' your order detail &nbsp #{order.token}")
  end
end
