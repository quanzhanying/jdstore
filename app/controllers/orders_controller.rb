class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    @order.generate_token

    if @order.save

      current_cart.cart_items.each do |cart_item|
        item_list = ItemList.new
        item_list.order = @order
        item_list.item_name = cart_item.item.title
        item_list.item_price = cart_item.item.price
        item_list.quantity = cart_item.quantity
        item_list.save
      end

      current_cart.remove_all_item
      @order.order_submitted_notification
      redirect_to customer_order_path(@order.token)
    else
      render 'carts/checkout'
    end

  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end

end
