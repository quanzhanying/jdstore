class Account::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :destroy]

    def index
      @orders = current_user.orders
    end

  # def cancel_order
  #   @order = current_user.orders.find(params[:id])
  #   @order.cancel!
  # end
end
