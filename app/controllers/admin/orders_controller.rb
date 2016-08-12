class Admin::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin

    layout 'admin'

  def index
    @orders = Order.all
  end

  def show
    @order = current_user.orders.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to :back, alert: "Order deleted!"
  end

end
