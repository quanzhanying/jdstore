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

      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.make_payment!
    @order.save

    redirect_to account_orders_path
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.make_payment!
    @order.save

    redirect_to account_orders_path
  end

  def cancell_order
    @order = Order.find(params[:id])
    @order.cancell_order!
    OrderMailer.notify_order_cancelled(@order).deliver!

    flash[:alert] = "下面没有了"
    redirect_to admin_orders_path
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_order_placed(@order).deliver!

    flash[:notice] = "信货两发发了"
    redirect_to admin_orders_path
  end


  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
