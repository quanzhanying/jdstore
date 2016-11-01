class CartItemsController < ApplicationController


  def destroy
    @cart = current_cart
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to :back
  end





  def update
    @cart =current_cart
     @cart_item = @cart.cart_items.find_by(product_id: params[:id])
     if @cart_item.product.quantity >= quantity_params[:quantity].to_i
       @cart_item.update(quantity_params)
        flash[:notice] ="Your items has been modified"
      else
        flash[:warning] ="no enough goods"
      end
      redirect_to carts_path

end





  private
  def quantity_params
    params.require(:cart_item).permit(:quantity)
 end

end
