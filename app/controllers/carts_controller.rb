class CartsController < ApplicationController

   def index
     @carts = Cart.all
   end


   def destroy
     @cart = current_cart
     @cart.destroy
     redirect_to :back
   end





end
