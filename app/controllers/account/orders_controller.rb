class Account::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :destroy]

  def index
    @orders = Order.all
    #@user = @orders.users
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to account_orders_path, alert: "Order deleted!"
  end
end
