class CartItemsController < ApplicationController


  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end



  def update

    @cart = current_cart
    @cart_item =@cart.cart_items.find_by(product_id: params[:id])
    if quantity_params[:quantity].to_i > 0

     if @cart_item.product.quantity >= quantity_params[:quantity].to_i
       @cart_item.update(quantity_params)
      flash[:notice]="ok "
     else
      flash[:warning]="已经超出库存数量"
     end
   else
     flash[:warning]="不能为0"
   end
    redirect_to carts_path

  end

  private
  def quantity_params
    params.require(:cart_item).permit(:quantity)
  end
end
