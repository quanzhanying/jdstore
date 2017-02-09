class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "成功将 #{@product.title} 从购物车删除！"
    redirect_to :back
  end

  def increase_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity < @cart_item.product.quantity
      @cart_item.quantity = @cart_item.quantity + 1
      @cart_item.save
      redirect_to carts_path
    end
  end

  def decrease_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity = @cart_item.quantity - 1
      @cart_item.save
      redirect_to carts_path
    end
  end
end
