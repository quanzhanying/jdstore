class CartItemsController < ApplicationController

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product: params[:id])
    @product = @cart_item.product

    @cart_item.destroy

    flash[:warning] = "成功将商品 #{@product.title} 从购物车中删除"
    redirect_to :back
  end

end
