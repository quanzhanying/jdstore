class CartsController < ApplicationController

  def show
    @cart_items = current_cart.cart_items
  end

  def checkout
    @order = Order.new
  end

  def destroy
    @cart = current_cart
    @cart.destroy

    @cart_item = CartItem.where( :cart_id => @cart.id)
    @cart_item.each do |d|
      d.destroy
    end

    redirect_to products_path
    flash[:notice] = '💥  购物车已清空'
  end

  # private
  #
  # def cart_params
  #   params.require(:cart).permit(:cart_item)
  # end

end
