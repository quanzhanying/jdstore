class CartItemsController < ApplicationController

  def destroy
    @cart = current_cart
    @cart_itme = @cart.cart_itmes.find_by(product_id: params[:id])
    @product = @cart_itme.product
    @cart_itme.destroy

    flahs[:warning] = "成功将 #{@product.title} 从购物车删除！"
    redirect_to :back
  end
end
