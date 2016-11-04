class OrderMailer < ApplicationMailer
  include Roadie::Rails::Automatic

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JD Store] Your order has been received #{order.token}")
  end

  def order_cancel_request(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JD Store] Your have requested to cancel order#{order.token}")
  end

  def notify_order_depatched(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JD Store] Your order is on its way! #{order.token}")
  end

  def notify_order_cancelled(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JD Store] Your order has been cancelled. #{order.token}")
  end

end
