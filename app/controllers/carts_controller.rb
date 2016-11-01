class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end
end
