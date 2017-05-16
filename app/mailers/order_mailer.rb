class OrderMailer < ApplicationMailer

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
  end

  def apply_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
  end

  def notify_ship(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
  end

  def notify_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
  end

end
