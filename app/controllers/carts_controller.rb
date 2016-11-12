class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def checkout
    @order = Order.new
  end

  def destroy_cart
    # @product = Product.find(params[:product_id])
    current_cart.cart_items.each do |item|
      item.destroy
    end
    redirect_to carts_path
  end

  # def destroy_item
  # current_cart.cart_items.each do |item|
  #   item.destroy
  # end
  #   redirect_to carts_path
  #
  # end

  # def destroy
  #   @cart = Cart.find(params[:cart_id])
  #   current_cart.
  #   @cart_item.destroy
  #
  #   redirect_to carts_path
  # end
end
