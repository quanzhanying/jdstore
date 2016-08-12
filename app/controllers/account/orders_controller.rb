class Account::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to account_orders_path, alert: "Order deleted!"
  end
end
