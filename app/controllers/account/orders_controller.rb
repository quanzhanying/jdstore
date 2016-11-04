class Account::OrdersController < ApplicationController
  def index
    @orders = Order.current_order(current_user).recent
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
      if @order.is_paid == true
        flash[:warning] = 'Order has been paid.'
      else
        @order.pay_with_alipay!
      redirect_to account_order_path(@order.token)
    end
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
      if @order.is_paid == true
        flash[:warning] = 'Order has been paid.'
      else
        @order.pay_with_wechat!
      redirect_to account_order_path(@order.token)
    end
  end

  def pay_with_apple
    @order = Order.find_by_token(params[:id])
      if @order.is_paid == true
        flash[:warning] = 'Order has been paid.'
      else
        @order.pay_with_apple!
      redirect_to account_order_path(@order.token)
    end
  end

  def cancel_order
    @order = Order.find_by_token(params[:id])
    @order.cancel_order!
    OrderMailer.notify_order_cancelled(@order).deliver!
    redirect_to :back
  end

  def wish_cancel
    @order = Order.find_by_token(params[:id])
    @order.wish_cancel!
    redirect_to :back
    OrderMailer.order_cancel_request(@order).deliver!
  end

  def deliver
    @order = Order.find_by_token(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def return_good
    @order = Order.find_by_token(params[:id])
    @order.return_good!
    redirect_to :back
  end

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :user_id, :shipping_name, :shipping_address, :token, :is_paid, :payment_method, :aasm_state)
  end

end
