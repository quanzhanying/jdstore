class CartsController < ApplicationController
  def destroy
    #@cart = Cart.find(params[:id])
    #@cart.cart_items.each do |cart_item|
    #  cart_item.destroy
    #end
    #@cart.destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end


  def empty_cart_items
    # @cart = Cart.find(params[:id])
    @cart = current_cart
    @cart.cart_items.destroy_all
    flash[:warning] = "Empty cart success！"
    redirect_to :back
  end

  def increase_item
    @cart_item = current_cart.cart_items.find(params[:id])
    @product = @cart_item.product
    if @cart_item.quantity + 1 >@product.quantity
    	flash[:warning] = "Sold out！"
	else
      @cart_item.quantity = @cart_item.quantity + 1
      @cart_item.save
    end
    redirect_to :back
  end


  def decrease_item
    @cart_item = current_cart.cart_items.find(params[:id])
    @product = @cart_item.product
    if @cart_item.quantity - 1 < 0

	else

    @cart_item.quantity = @cart_item.quantity - 1
    @cart_item.save
    redirect_to :back
  	end

  end
end
