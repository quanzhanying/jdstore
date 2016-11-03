class CartItemsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.product.quantity >= quantity_params[:quantity].to_i
      @cart_item.update(quantity_params)
      flash[:notice] = '是的，老板我已经上货了'
    else
      flash[:warning] = '货物不够，请及时剁手'
      end
    redirect_to carts_path
end

  private

  def quantity_params
    params.require(:cart_item).permit(:quantity)
 end
end
