class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show

    @order = Order.find_by_token(params[:id])

  end


end
