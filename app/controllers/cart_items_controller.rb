class CartItemsController < ApplicationController

  def destroy
    @cart_item=current_cart.cart_items.find_by(product_id: params[:id])
    @product=@cart_item.product
    @cart_item.destroy

    flash[:warning]="已经将#{@product.title}从购物车中删除！"
    redirect_to :back
  end

end
