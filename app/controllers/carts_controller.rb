class CartsController < ApplicationController


  def delall
    current_cart.destroy
    redirect_to carts_path
  end

  def minusitem
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def upitem
    @ci = CartItem.find(params[:id])
    @ci.upup!
    redirect_to :back
  end

  def downitem
    @ci = CartItem.find(params[:id])
    @ci.downdown!
    redirect_to :back
    end

    
  def checkout
    @order = Order.new
  end
end
