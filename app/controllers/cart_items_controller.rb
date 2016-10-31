class CartItemsController < ApplicationController


  def destroy

    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to :back
  end
  def edit
  @cart_item = CartItem.find(params[:id])
end

  def change_quantity(quantity_params)
    cart_id = params[:cart_item_id]
    @cart =current_cart
    @cart_item = CartItem.find(params[:id])

    if quantity <= @cart_item.product.quantity
      @cart_item.quantity = quantity_params
      @cart_item.save!
      rediect_to :back
    else
      redirect_to :back, notice:"卖光了！"
    end
  end





  private
  def quantity_params
    params.require(:cart_item).permit(:quanity)
 end

end
