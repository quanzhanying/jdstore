class Account::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    if current_user.admin?
      @order = Order.find_by_token(params[:id])
      @product_lists = @order.product_lists
    else
      @order = current_user.orders.find_by_token(params[:id])
      @product_lists = @order.product_lists
    end

  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to :back
  end

  # def destroy
  #   @order = Order.find(params[:id])
  #   @order.destroy
  #   redirect_to account_orders_path, alert: "Order deleted!"
  # end

    def destroy
    @order = Order.find(params[:id])

    @order.destroy
    redirect_to account_orders_path, alert: '訂單已刪除'
  end

end
