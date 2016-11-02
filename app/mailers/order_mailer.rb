class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order   = order
    @user    = order.user
    @item_lists = @order.item_lists

    mail(to: @user.email, subject:"[JD online] This is your recnet order's information")
  end
end
