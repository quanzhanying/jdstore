class Admin::OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :require_is_admin
  before_action :get_order_from_params, except: [:index]
  layout 'admin'

  def index
    @orders = Order.all.order("created_at ASC")
  end

  def show
    @item_lists = @order.item_lists
  end

  def ship
    @order.ship!
    
    JdstoreMailer.ship_notification(@order).deliver!
    redirect_to :back
  end

  def cancel_order
    if !@order.may_make_payment?
      @order.cancel_order!
    end

    redirect_to :back
  end

  private

  def get_order_from_params
    @order = Order.find_by_token(params[:id])
  end

end
