class Admin::OrdersController < ApplicationController
  layout "admin"

  def index
    @orders = Order.all.recent
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end
end
