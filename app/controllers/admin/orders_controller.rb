class Admin::OrdersController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @orders = case params[:state]
              when 'placed'
                Order.where(aasm_state: "order_placed").order('id DESC')
              when 'paid'
                Order.where(aasm_state: "paid").order('id DESC')
              when 'ship'
                Order.where(aasm_state: "shipping").order('id DESC')  
              when 'cancelled'
                Order.where(aasm_state: ["order_cancelled", "good_returned"]).order('id DESC')
              when 'finished'
                Order.where(aasm_state: "shipped").order('id DESC')
              else
                Order.order('id DESC')
              end
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end
end
