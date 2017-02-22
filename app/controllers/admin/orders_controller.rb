class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  ends

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
end
