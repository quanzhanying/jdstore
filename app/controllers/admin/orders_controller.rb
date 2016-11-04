class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!#, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  layout "admin"

  def index
    @orders = Order.all.recent
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find_by_token(params[:id])
    @order.ship!
    OrderMailer.notify_order_depatched(@order).deliver!
    redirect_to :back
  end

  def cancel_order
    @order = Order.find_by_token(params[:id])
    @order.cancel_order!
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :user_id, :shipping_name, :shipping_address, :token, :is_paid, :payment_method, :aasm_state)
  end

end
