class CartsController < ApplicationController
  def checkout
    @order = Order.new
  end

  def destroy
   @cart = Cart.find(params[:id])

   @cart.destroy
   redirect_to :back
 end
end
