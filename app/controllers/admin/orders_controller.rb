class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @chef_shadow = ChefShadow.find_by(order_id: @order.id)
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find(params[:id])
    @chef = ChefShadow.find_by(order_id: @order.id)
    @order.ship!
    OrderMailer.notify_ship(@order, @chef).deliver!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    @chef = ChefShadow.find_by(order_id: @order.id)
    @order.cancell_order!
    OrderMailer.notify_cancel(@order, @chef).deliver!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end
end
