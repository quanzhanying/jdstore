class CartsController < ApplicationController

#  def remove_product_from_cart
  def destroy
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.destroy
      flash[:notice] = "Delete product success！"
    else
      flash[:warning] = "Delete product failed！"
    end
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end
  
end
