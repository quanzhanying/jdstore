class CartsController < ApplicationController
    def clear
        @cart = Cart.find(params[:id])
        @cart.clear_all_cart_items
        flash[:alert] = "购物车已清空"
        redirect_to :back
    end
end
