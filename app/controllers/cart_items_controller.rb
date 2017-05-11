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
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = "成功变更数量"
    else
      flash[:warning] = "库存数量不足以加入购物车"
    end

    redirect_to carts_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
