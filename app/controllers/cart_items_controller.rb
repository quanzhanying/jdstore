class CartItemsController < ApplicationController

   def index
     @cart_items = CartItem.all
   end

   def destroy
     @cart_item = CartItem.find(params[:id])
     @cart_item.destroy
     redirect_to carts_path
   end
end
