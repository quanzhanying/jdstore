class CartsController < ApplicationController
    def clear
        @cart = Cart.find(params[:id])
        @cart.clear_all_cart_items
        flash[:alert] = "购物车已清空"
        redirect_to :back
    end

    def checkout
        @order = Order.new
    end

    def clean
        current_cart.clean!
    end

end
