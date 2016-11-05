class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @orders = Order.all
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

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def notify_order_cancel
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
    if @order.aasm_state == "order_cancelled"
      flash[:warning] = "订单之前已经被取消"
      redirect_to account_orders_path
    else
      @order.aasm_state == "paid"
      @order.cancell_order!
      flash[:warning] = "订单取消中"
      # OrderMailer.notify_order_cancel(@order).deliver
      redirect_to account_orders_path
    end

  end

  def notify_order_cancel_by_admin
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
    if @order.aasm_state == "order_cancelled"
      flash[:warning] = "订单之前已经被取消"
      redirect_to admin_orders_path
    else
      @order.cancell_order!
      flash[:warning] = "取消订单"
      # OrderMailer.notify_order_cancel_by_admin(@order).deliver
      redirect_to admin_orders_path
    end

  end

  def ship
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
    if @order.aasm_state == "paid"
       flash[:warning] = "打包中"
       @order.ship!
      #  OrderMailer.notify_order_ship(@order).deliver
       redirect_to admin_orders_path
    else
      redirect_to admin_orders_path
      flash[:warning] = "请联系客服"
    end

  end

  def pay_with_alipay
    @order = Order.find(params[:id])
    @order.payment_method = 'alipay'

    @order.is_paid = true
      if @order.save
        flash[:notice] = "付款success"
        redirect_to carts_path
      else
        flash[:notice] = "付款失败！请重试"
        redirect_to :back
      end

  end

  def pay_with_wechat
    @order = Order.find(params[:id])
    @order.payment_method = 'wechat'
    @order.is_paid = true
    if @order.save
      flash[:notice] = "付款success"
      redirect_to carts_path
    else
      flash[:notice] = "付款失败！请重试"
      redirect_to :back
    end
  end

  def go_pay
    payment_method = params[:payment_method]
    @order = Order.find(params[:id])
    # OrderMailer.notify_order_placed(@order).deliver


    if @order.is_paid
      flash[:alert] = "无需再次支付"
      redirect_to :back
      return
    end

    @order.payment_method = payment_method
    @order.is_paid = true

    if @order.save
      flash[:notice] = "支付成功"
      redirect_to account_orders_path
    else
      flash[:notice] = "支付失败"
      redirect_to :back
    end

    @order.make_payment!

  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
