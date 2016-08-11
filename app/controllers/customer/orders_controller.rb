class Customer::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order_from_params, except: [:index]
  layout 'customer'


  def index
    @orders = current_user.orders
  end

  def show
    @item_lists = @order.item_lists
  end

  def pay_with_wechat
    @order.pay("wechat")
    redirect_to :back
  end


  def pay_with_alipay
    @order.pay("alipay")
    redirect_to :back
  end

  def request_a_return
    @order.request_a_return!
    redirect_to :back
  end

  def request_a_refund
    @order.request_a_refund!
    redirect_to :back
  end

  def receive_goods
    @order.received!
    redirect_to :back
  end

  def cancel_order
    if @order.may_make_payment?
      @order.cancel_order!
    end
    redirect_to :back
  end

  private

  def get_order_from_params
    @order = Order.find_by_token(params[:id])
  end

end
