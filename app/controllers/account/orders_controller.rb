class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.recent
  end

  def apply_cancle_order
    order = current_user.orders.find(params[:order_id])
    if order.apply_cancle_order!
      flash[:notice] = "Successfully appling cancle order..."
    else
      flash[:alert] = "Faild appling cancle order..."
    end
    redirect_to account_orders_path
  end

  def apply_return_good
    order = current_user.orders.find(params[:order_id])
    if order.apply_return_good!
      flash[:notice] = "Successfully appling return good..."
    else
      flash[:alert] = "Faild appling return good...."
    end
    redirect_to account_orders_path
  end

  def confirm_receipt
    order = current_user.orders.find(params[:order_id])
    if order.confirm_receipt!
      flash[:notice] = "Successfully cofirm receipt"
    else
      flash[:alert] = "Faild confirm receipt"
    end
    redirect_to account_orders_path
  end


end
