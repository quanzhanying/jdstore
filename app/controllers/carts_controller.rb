class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end


  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy
    redirect_to root_path
  end

  def remove_item_from_cart

    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

end
