class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")   #equals to @orders = Order.all.order("id DESC")

  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists

  end
end
