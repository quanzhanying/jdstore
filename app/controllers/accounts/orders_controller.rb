class Accounts::OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def index
    @orders = Order.where(:user_id => current_user)
  end

  def show
    @order = Order.where(:user_id => current_user)
    # @item_lists = @order.item_lists
  end

end
