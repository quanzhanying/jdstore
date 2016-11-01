class CartsController < ApplicationController


  def  index
    @cart = current_cart
    @cart_items = @cart.cart_items.all
  end


  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] =nil
    redirect_to :back, notice: "The cart is empty now."
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
  def checkout
    @order = Order.new
  end
end
