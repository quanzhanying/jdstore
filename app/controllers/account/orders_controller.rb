class Account::OrdersController < ApplicationController

    def index
      @orders = current_user.orders
    end

    def show
      @order = Order.find_by_token(params[:id])
      @product_lists = @order.product_lists
    end

end
