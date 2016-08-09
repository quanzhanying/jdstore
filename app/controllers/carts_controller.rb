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
end
