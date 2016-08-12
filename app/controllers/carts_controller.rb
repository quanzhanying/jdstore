class CartsController < ApplicationController

  def destroy_cart
    # @cart = Cart.find(session[:cart_id])
    #   @cart.destroy
    current_cart.destroy
    redirect_to carts_path
  end

  def number_up
    @ci = CartItem.find(params[:id])
    @ci.number_up!
    redirect_to carts_path
  end

  def number_down
    @ci = CartItem.find(params[:id])
    @ci.number_down!
    redirect_to :back
  end

  def quantity
    @num = Product.find(params[:id])
    @num.quantity
  end

  def checkout
    @order = Order.new
  end


end
