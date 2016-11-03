class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    # @order = Order.new(order_params)
    # @order.user = current_user
    @order = current_user.orders.build(order_params)
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.product.quantity
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
    @order.user = current_user
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
      if @order.is_paid == true
        flash[:warning] = 'Order has been paid.'
      else
        @order.pay_with_alipay!
      redirect_to order_path(@order.token)
    end
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
      if @order.is_paid == true
        flash[:warning] = 'Order has been paid.'
      else
        @order.pay_with_wechat!
      redirect_to order_path(@order.token)
    end
  end

  def pay_with_apple
    @order = Order.find_by_token(params[:id])
      if @order.is_paid == true
        flash[:warning] = 'Order has been paid.'
      else
        @order.pay_with_apple!
      redirect_to order_path(@order.token)
    end
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :user_id, :shipping_name, :shipping_address, :token, :is_paid, :payment_method, :aasm_state)
  end

end
