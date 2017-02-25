class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save

      current_cart.cart_items.each do |cart_item|
        product_lists = ProductList.new
        product_lists.order = @order
        product_lists.product_name = cart_item.product.title
        product_lists.product_price = cart_item.product.price
        product_lists.quantity      = cart_item.quantity
        product_lists.save
      end
      current_cart.clean!  #清空购物车
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_address, :shipping_name)
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    @order.pay!

    redirect_to order_path(@order.token), notice: "使用支付宝成功完成付款"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    @order.pay!

    redirect_to order_path(@order.token), notice: "使用微信完成付款"
  end
end
