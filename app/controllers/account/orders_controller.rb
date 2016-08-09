class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all.where(user_id: current_user.id)
  end

  def apply_cancle_order
    order = Order.find_by_id_and_user_id(params[:order_id], current_user.id)
    if order.apply_cancle_order!
      flash[:notice] = "Successfully appling cancle order..."
    else
      flash[:alert] = "Faild appling cancle order..."
    end
    redirect_to account_orders_path
  end

  def apply_return_good
    order = Order.find_by_id_and_user_id(params[:order_id], current_user.id)
    if order.apply_return_good!
      flash[:notice] = "Successfully appling cancle order..."
    else
      flash[:alert] = "Faild appling cancle order..."
    end
    redirect_to account_orders_path
  end
end
