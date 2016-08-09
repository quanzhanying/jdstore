class Customer::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout 'customer'


  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by_token(params[:id])
    @item_lists = @order.item_lists
  end

end
