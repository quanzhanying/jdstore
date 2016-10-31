class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find()
  end

  def new
    @cart = Cart
  end


  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to carts_path
  end
end
