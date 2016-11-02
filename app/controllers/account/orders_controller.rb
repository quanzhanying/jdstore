class Account::OrdersController < ApplicationController
  def index

    @orders = Order.current_order(current_user).recent
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end


end
