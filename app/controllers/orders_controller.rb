class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def new
    @order = Order.new
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
    # OrderMailer.notify_order_placed(@order).deliver!
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.price
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])

    if @order.is_paid
      flash[:alert] = '已支付！'

      redirect_to :back
    else
      @order.is_paid = true
      @order.payment_method = '支付宝'
      @order.make_payment!
      @order.save

      end
    redirect_to :back
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    if @order.is_paid
      flash[:alert] = '已支付！'

      redirect_to :back
    else
      @order.is_paid = true
      @order.payment_method = '微信'
      @order.make_payment!
      @order.save

      end
    redirect_to :back
  end

  def cancell_order
    @order = Order.find(params[:id])
    @order.cancell_order!
    @order.save
    redirect_to :back
    # OrderMailer.notify_order_cancelled(@order).deliver!
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    @order.save
    redirect_to :back
  end

  def deliver
    @order = Order.find(params[:id])
    @order.deliver!
    @order.save
    redirect_to :back
    # OrderMailer.notify_shipped(@order).deliver!
end
    def return_good
      @order = Order.find(params[:id])
      @order.good_returned?
      @order.save
      redirect_to :back
      # OrderMailer.notify_good_returned(@order).deliver!
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method, :is_cancell, :is_ship)
  end
end
