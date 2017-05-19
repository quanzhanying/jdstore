class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders("id DESC")
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @deliver!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end
  

end
