class CartsController < ApplicationController

  def destroy
    @cart = Cart.find(params[:id])

    @cart.cart_items.each do |cart_item|
      cart_item.destroy
    end
    @cart.destroy
    redirect_to carts_path
  end

  def delete_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "Deleted!"
    redirect_to :back
  end

  def add_an_item
    @cart_item = CartItem.find(params[:id])
    @product = Product.find(@cart_item[:product_id])
    if @cart_item.quantity < @product.quantity
      @cart_item.quantity += 1
      @cart_item.save
    end
    redirect_to :back
  end

  def minus_an_item
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
      @cart_item.save
    end
    redirect_to :back
  end

end
