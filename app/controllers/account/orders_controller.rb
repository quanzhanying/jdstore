class Account::OrdersController < ApplicationController
  def index
    @orders = Order.all.recent
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end


end
