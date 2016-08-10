class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save

      current_cart.cart_items.each do |c|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = c.product.title
        product_list.product_price = c.product.price
        product_list.quantity = c.quantity
        product_list.save
      end
      redirect_to order_path(@order.token)
    else
      render :new
    end
end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
