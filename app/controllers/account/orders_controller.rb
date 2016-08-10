class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show

    @order = Order.find_by_token(params[:id])
    #render :text => params[:token]
    #flash[:notice] = @order.billing_name
    #flash[:notice] = @order.id
    @product_lists = @order.product_lists
  end
end
