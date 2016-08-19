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

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])

    if @order.pingpp_info.blank?

      @pay_object = Pingpp::Charge.create(
        subject: 'Your Subject',
        body: 'Your Body',
        amount: 100,
        order_no: '123456789',
        channel: 'alipay_pc_direct',
        currency: 'cny',
        client_ip: '127.0.0.1',
        app: { 'id' => PINGPP_APP_ID },
        extra: { success_url: 'http://baidu.com' }
      )
      @order.pingpp_info = @pay_object['credential']
      @order.save
    end

    redirect_to AlipayService.new(@order).fullurl
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
