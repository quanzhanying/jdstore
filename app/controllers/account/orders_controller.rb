class Account::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by_token(params[:id])
  end

  def cancell_order
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!
  end

  private
  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method, :aasm_state)
  end


end
