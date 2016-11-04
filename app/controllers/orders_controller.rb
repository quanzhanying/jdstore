class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @orders = Order.all
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end


  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.is_paid = true
    @order.payment_method = "支付宝"
    @order.make_payment!
    @order.save
    OrderMailer.notify_order_placed(@order).deliver!
    redirect_to account_orders_path

  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.is_paid = true
    @order.payment_method = "微信"
    @order.make_payment!
    @order.save
    OrderMailer.notify_order_placed(@order).deliver!
    redirect_to account_orders_path
  end

  def cancell_order
    @order = Order.find(params[:id])
    @order.cancell_order!
    OrderMailer.notify_order_cancelled(@order).deliver!
    redirect_to :back
    flash[:alert] = "订单取消成功"
  end

  def cancelled
    @order = Order.find(params[:id])
    @order.cancell_order = true
    @order.cancelled!

    redirect_to :back
    flash[:alert] = "订单取消成功"
    @order.save
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!

    OrderMailer.notify_order_ship(@order).deliver!
    redirect_to :back
    @order.save
    flash[:alert] = "出货成功"
  end

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




   private

   def order_params
     params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
