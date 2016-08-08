class CartsController < ApplicationController

    def delete_one
      @cart_item = CartItem.find_by(params[:id])
      @cart_item.destroy
      redirect_to carts_path,alert: "Success delete"
    end

    def destroy
      @cart = Cart.find(params[:id])
      if @cart.cart_items.destroy_all
        redirect_to carts_path, alert: "Success delete"
      end
    end

    def incream_quantity
      @cart_item = CartItem.find_by(params[:id])
      @cart_item.quantity = @cart_item.quantity + 1
      @cart_item.save
      redirect_to carts_path
    end

    def decream_quantity
      @cart_item = CartItem.find_by(params[:id])
      if @cart_item.quantity > 0
        @cart_item.quantity = @cart_item.quantity - 1
        @cart_item.save
        redirect_to carts_path
      else
        redirect_to :back, alert: "The quantity can't be 0"
      end

    end

end
