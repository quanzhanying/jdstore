class Account::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :destroy]

  def index
    @orders = Order.recent

  end

  def show
    @order = Order.find_by_token(params[:id])

  end

end
