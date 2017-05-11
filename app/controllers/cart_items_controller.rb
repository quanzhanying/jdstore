class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart                                              #确定购物车
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])    #确定购物车内的商品清单
    @product = @cart_item.product
    @cart_item.destroy                                                #删除这条商品清单

    flash[:warning] = "成功将 ''#{@product.title}'' 从购物车删除!"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @cart_item.update(cart_item_params)

    redirect_to carts_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
