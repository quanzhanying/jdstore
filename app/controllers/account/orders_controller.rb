class Account::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find_by_token(params[:id])
  end
end
