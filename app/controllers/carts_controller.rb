class CartsController < ApplicationController
  def index
  end

  # def new
  #   @cart = Cart.new
  # end
  #
  # def create
  #   @cart = Cart.new(cart_params)
  #   if @cart.save
  #     redirect_to carts_path
  #   else
  #     render :new
  #   end
  # end

  def destroy
    @cart = current_cart
    @cart = Cart.find(params[:id])
    @cart.destroy
    @cart.cart_items.destroy
    redirect_to root_path
  end

  def checkout
    @order = Order.new
  end

end
