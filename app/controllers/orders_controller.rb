class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @order = Order.all
    @product_lists = @order.product_lists

  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def  pay_with_alipay
   @order = Order.find_by_token(params[:id])
   if !@order.is_paid
     @order.is_paid = true
     flash[:warning] = "Order has been paid."
     @order.make_payment!
   else
     redirect_to order_path(@order.token)
   end
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    if !@order.is_paid
      @order.is_paid = true
      flash[:warning] = "Order has been paid."
      @order.make_payment!

    else
      @order.pay_with_wechat!
      redirect_to order_path(@order.token)
    end
  end
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

  def ship

    @order = Order.find_by_token(params[:id])
    #binding.pry
    @order.ship!
    @order.save

    redirect_to :back
  end


  def cancell_order
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!
    redirect_to :back

  end

  def deliver
    @order = Order.find_by_token(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def return_good
    @order = Order.find_by_token(params[:id])
    @order.return_good!
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :pay_with_alipay, :pay_with_wechat)
  end
end
