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

  def pay_with_wechat
    @order = Order.find(params[:id])
    @order.payment_method = "微信"
    @order.save
    redirect_to order_path(@order.token)
  end

  def pay_with_alipay
    @order = Order.find(params[:id])
    @order.payment_method = "支付宝"
    @order.save
    redirect_to order_path(@order.token)
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :payment_method)
  end
end
