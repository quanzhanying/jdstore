class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    #@order.pay!  未加状态机前的支付方式，model／order.rb里能找到。
    @order.make_payment! #来源与model/order.rb 触发动作。

    redirect_to order_path(@order.token), notice: "使用支付宝成功完成付款"
  end

  def apply_to_cancel
    @order = Order.find(params[:id])
    OrderMailer.apply_cancel(@order).deliver!
    flash[:notice] = "已提交申请"
    redirect_to :back
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    #@order.pay!
    @order.make_payment! #来源与model/order.rb 触发动作。

    redirect_to order_path(@order.token), notice: "使用微信支付成功完成付款"
  end # (@order.token)是故意打乱的url

  def create
    @order = Order.new(order_params)
    @order.user = current_user #order belongs_to user 它可以跟user id 被调用，然后有user_id
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
      # current_cart.clean! 不懂这句话是用来干嘛的，一显示就报错。
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
