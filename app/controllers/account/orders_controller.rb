class Account::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def return_good
    @order = Order.find_by_token(params[:id])
    @order.return_good!
    redirect_to account_orders_path
  end

  def deliver
    @order = Order.find_by_token(params[:id])
    @order.deliver!
    redirect_to account_orders_path
  end

  def require_cancel
    @order = Order.find_by_token(params[:id])
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to  products_path
  end


end
