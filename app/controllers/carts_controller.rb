class CartsController < ApplicationController


  def destroy_item
     @cart_item = CartItem.find(params[:id])
     # @cart.cart_items.each do |cart_item|
     @cart_item.destroy
     
     

     # #@cart.destroy
     # @cart_item = current_cart.cart_items.find(params[:id])
     # @cart.cart_items.each do |cart_item|
     # @cart_item.destroy
     
    redirect_to carts_path
  end


  def empty_cart_items
    @cart = Cart.find(params[:id])
    @cart = current_cart
    @cart.cart_items.destroy_all
    flash[:warning] = "已清空！"
    redirect_to :back
  end

  def increase_item
    @cart_item = current_cart.cart_items.find(params[:id])
    @product = @cart_item.product
    if @cart_item.quantity + 1 >@product.quantity
    	flash[:warning] = "好货有限，没有更多啦！😋"
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

  def checkout
    @order = Order.new
  end

end
