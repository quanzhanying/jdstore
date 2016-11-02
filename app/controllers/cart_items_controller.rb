class CartItemsController < ApplicationController


  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end



  def update

    @cart = current_cart
    @cart_item =@cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.update(quantity_params)
      flash[:notice]="ok "
    else
      flase[:warning]="no enough goods"
    end

    redirect_to carts_path

  end

  private
  def quantity_params
    params.require(:cart_item).permit(:quantity)
  end
end
