class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end


  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy
    redirect_to root_path
  end

def add_product
 @cart_item = CartItem.find(params[:id])
 @product = @cart_item.product
 if (@cart_item.quantity + 1) > @product.quantity
   flash[:alert]="sorry, we don't have enough items for you"
 else
 @cart_item.quantity = @cart_item.quantity + 1
 @cart_item.save
 redirect_to :back
 end
 end

 def reduce_product
   @cart_item = CartItem.find(params[:id])
   @cart_item.quantity = @cart_item.quantity - 1
   @cart_item.save
   redirect_to :back
 end

def checkout
  @order = Order.new
end

  # def remove_item_from_cart
  #
  #   @cart_item = CartItem.find(params[:id])
  #   @cart_item.destroy
  #   redirect_to :back
  # end

end
