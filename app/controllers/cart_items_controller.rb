class CartItemsController < ApplicationController
  def update
#    @cart_item = CartItem.find(params[:id])
#    if cart_item_params[:quantity].to_i > @cart_item.product.quantity
#      flash[:alert] = "购买数量超过库存"
#    else
#      @cart_item.update(cart_item_params)
#      flash[:notice] = "成功更新购物车"
#    end

    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "Update cart success"
    else
      flash[:warning] = "Update cart fail"
    end
    redirect_to carts_path
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "Successfully delete #{@product.title}"
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
