class Customer::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order_from_params, only: [:show, :pay_with_wechat, :pay_with_alipay]
  layout 'customer'


  def index
    @orders = current_user.orders
  end

  def show
    @item_lists = @order.item_lists
  end

  def pay_with_wechat
    @order.payment_method = "wechat"
    @order.is_paid = true

    if @order.save
      redirect_to :back
    end
  end


  def pay_with_alipay

    @order.payment_method = "alipay"
    @order.is_paid = true

    if @order.save
      redirect_to :back
    end
  end

  private

  def get_order_from_params
    @order = current_user.orders.find_by_token(params[:id])
  end

end
