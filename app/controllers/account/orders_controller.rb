class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders
 end


 def cancell
   @order = Order.find(params[:id])
   @order.cancell_order!
   @order.save
   redirect_to :back
   OrderMailer.notify_order_cancelled(@order).deliver!
 end

 def destroy
   @order = Order.find(params[:id])
   @order.destroy

   redirect_to :back
 end

 end
