class OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end

      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end

  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def cancell_order_from_user
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!
    OrderMailer.notify_order_cancelled_from_user(@order).deliver!
    redirect_to :back
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

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    if @order.is_paid == false
      @order.wechat_pay!
      @order.make_payment!
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to order_path(@order.token)
    else
      flash[:alert] = '您已经付款了哦'
        redirect_to :back
    end
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    if @order.is_paid == false
      @order.alipay_pay!
      @order.make_payment!
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to order_path(@order.token)
    else
      flash[:alert] = '您已经付款了哦'
        redirect_to :back
    end
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :payment_method)
  end
end
