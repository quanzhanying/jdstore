class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

     def index
       @orders = current_user.orders
   end

   def cancelling
      @order = Order.find_by_token(params[:id])


      redirect_to :back, notice:'已提交订单请求！'
    end


   end
