class Admin::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find_by_token(params[:id])
    @order.ship!
    redirect_to :back
  end

  def cancell_order
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!
    redirect_to :back
  end


end
