class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

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
      current_cart.destroy
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
    @order = Order.find_by_token(params[:id])
    @order.pay!
    @order.set_payment_with!("wechat")


    redirect_to :back,notice: "听说你用微信付钱了，哈哈哈你被骗了"
  end

  def pay_with_alipay
  @order = Order.find_by_token(params[:id])
  @order.pay!
  @order.set_payment_with!("alipay")

  redirect_to :back,notice: "听说你用支付宝付钱了，悄悄告诉你被骗了"
end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
