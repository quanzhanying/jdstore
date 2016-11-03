class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy

    flash[:alert] = "Cart_item Deleted"
    redirect_to carts_path
  end

  def add_one   #其实是edit功能
    @cart_item = current_cart.cart_items.find(params[:id])
    @product = @cart_item.product
    # sum = 1
    @cart_item.quantity = @cart_item.quantity + 1
    if @cart_item.quantity <= @product.quantity
      @cart_item.save

      redirect_to :back
    else
      @cart_item.quantity = @cart_item.quantity
      redirect_to carts_path
    end
  end

  def minus_one
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.quantity = @cart_item.quantity - 1
    @cart_item.save
    redirect_to :back
  end


end
