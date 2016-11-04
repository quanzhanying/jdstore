class CartsController < ApplicationController

  def destroy
    @cart = current_cart
    @cart.destroy

    @cart_items = CartItem.where(:cart_id => @cart.id)
    @cart_items.each do |d|
      d.destroy
    end



    redirect_to root_path
  end


  def checkout
    @order = Order.new
  end


  def plus_quantity
    @cart_item = CartItem.where(:cart_id => @cart.id)
    @cart_item.quantity += 1
    @cart_item.save
  end


end
