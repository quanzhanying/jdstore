class CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path, alert: '删除成功'
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
