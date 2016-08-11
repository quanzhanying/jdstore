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
    current_cart.cart_items.each do |item|
      if item.quantity < 1
        flash[:notice] = "您还没有购物不能结账"
        redirect_to :back
        return
      end
    end
  end
end
