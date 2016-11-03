class Admin::OrdersController < ApplicationController

    before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

    def index
      @orders = Order.all
    end

    def show
      @order = Order.find_by_token(params[:id])
    end

    def ship
      @order = Order.find_by_token(params[:id])
      @order.ship!
      redirect_to  admin_orders_path
    end

    def cancel
      @order = Order.find_by_token(params[:id])
      @order.cancell_order!
      redirect_to  admin_orders_path
    end

    def deliver
      @order = Order.find_by_token(params[:id])
      @order.deliver!
      redirect_to  admin_orders_path
    end

    def return
      @order = Order.find_by_token(params[:id])
      @order.return_good!
      redirect_to  admin_orders_path
    end

end
