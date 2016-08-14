class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order # What is the order?
    @user = order.user
    @product_lists = order.product_lists

    mail(to: @user.email, subject: "[JD Store] thanks for your order. Order(#{order.token}) details are as follows!")
  end

  def notify_apply_cancell(o)
    @order = o
    @user = o.user
    @product_lists = o.product_lists

    mail(to: "siningdream@gmail.com", subject: "[JD Store] #{@user.email} apply to cancell order No.#{o.id}")
  end
end
