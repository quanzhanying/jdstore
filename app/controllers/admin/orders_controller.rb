class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "sidebar"

  def index
    @orders = Order.all
  end

  def cancell_order
    @order = Order.find_by_token(params[:id])
    if @order.order_placed? or @order.paid?
      @order.cancell_order!
    end
    redirect_to admin_orders_path
  end

  def ship
    @order = Order.find_by_token(params[:id])
    if @order.paid?
      @order.ship!
    end
    redirect_to admin_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method, :aasm_state)
  end

end
