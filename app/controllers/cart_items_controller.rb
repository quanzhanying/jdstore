class CartItemsController < ApplicationController



    #before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "成功将 #{@product.title} 从购物车删除!"
    redirect_to :back
  end


  def add_number
    @item=current_cart.cart_items.find_by(product_id: params[:id])
    @product = Product.find(params[:id])
    if @product.quantity>@item.quantity
      @item.quantity += 1
      @item.save
    else
      flash[:alert]='库存不足，不能购买'
    end
    redirect_to :back

  end

  def reduce_number
    @item=current_cart.cart_items.find_by(product_id: params[:id])
    if @item.quantity>1
      @item.quantity -= 1
      @item.save
    end
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
