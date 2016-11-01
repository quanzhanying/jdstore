class CartsController < ApplicationController
    def index
      @cart=current_cart
      @cartitem=CartItem.where(:cart_id => @cart.id)
    end

    def destroy
      @cart=current_cart
      @cart.destroy
      @cart_item=CartItem.where(:cart_id => @cart.id)
      @cart_item.each do |d|
        d.destroy
    end
      redirect_to carts_path
    end

end
