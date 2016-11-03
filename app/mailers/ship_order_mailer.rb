class ShipOrderMailer < ApplicationMailer

  def notify_shipping(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]您的订单 #{order.token} 已发货，请注意查收")
  end

end
