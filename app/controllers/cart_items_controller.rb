class CartItemsController < ApplicationController

  def add_an_item
    @cart_item = CartItem.find(params[:id])
    @product = Product.find(@cart_item[:product_id])
    if @cart_item.quantity < @product.quantity
       @cart_item.quantity += 1
       @cart_item.save
     else
       flash[:warning] = "Store not enough"
     end
     redirect_to :back
   end

   def minus_an_item
     @cart_item = CartItem.find(params[:id])
     if @cart_item.quantity > 1
       @cart_item.quantity -= 1
       @cart_item.save
     else
      flash[:notice] = "The quantity just 1pc, are you sure to delete?"
     end
      redirect_to :back
    end

end
