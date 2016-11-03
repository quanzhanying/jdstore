class OrdersController < ApplicationController
  before_action :authenticate_user!,only:[:create]

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def create
    @order=Order.new(order_params)
    @order.user = current_user
    @order.total=current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_price = cart_item.product.price
        product_list.product_name = cart_item.product.title
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
       flash[:alert]="已经支付，不用支付了"
       redirect_to :back
     else
       @order.is_paid=true
       @order.payment_method="支付宝支付"
       @order.save
       flash[:notice]="支付宝成功"
       redirect_to :back
     end



   end

   def pay_with_wechat
     @order = Order.find_by_token(params[:id])

     if @order.is_paid
       flash[:alert]="已经支付，不用再支付了"
       redirect_to :back
     else
       @order.is_paid=true
       @order.payment_method="微信支付"
       @order.save
       flash[:notice]="微信支付成功"
       redirect_to :back
     end


   end

  private

  def order_params
    params.require(:order).permit(:billing_name,:billing_address,:shipping_name,:shipping_address,:token)
  end
end
