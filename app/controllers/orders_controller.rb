class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save

      current_cart.cart_items.each do |cart_item|
        product_lists = ProductList.new
        product_lists.order = @order
        product_lists.product_name = cart_item.product.title
        product_lists.product_price = cart_item.product.price
        product_lists.quantity      = cart_item.quantity
        product_lists.save
      end
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_address, :shipping_name)
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
end
