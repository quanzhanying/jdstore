class CartItemsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path

  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @product = @cart_item.product
    if @cart_item.quantity < @product.quantity
      @cart_item.quantity += 1
      @cart_item.save
      redirect_to carts_path
    else
      flash[:warning] = "库存没有了哦！"
      redirect_to carts_path
    end
  end

  def minus_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
      @cart_item.save
      redirect_to carts_path
    else
      flsh[:alert] = "少一件了哦"
      redirect_to carts_path
    end
  end
end
