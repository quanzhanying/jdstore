class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find_by_token_and_user_id(params[:id], current_user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total_price = current_cart.total_price
    if @order.save

      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product = cart_item.product
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.image = cart_item.product.image.thumb
        product_list.save
      end

      current_cart.destroy

      flash[:notice] = "Successfully built..."
      redirect_to order_path(@order.token)
    else
      flash[:alert] = "faild built..."
      # @order = Order.new
      # @cart_items = current_cart.cart_items
      render "carts/check_out"
      # redirect_to check_out_carts_path
    end
  end

  def pay_with_alipay
    # 要加权限 只能修改本人
    order = Order.find_by_token_and_user_id(params[:id], current_user.id)
    if order.pay!("Alipay")
      flash[:notice] = "Pay Successfully."
    else
      flash[:alert] = "Pay Faild"
    end
    redirect_to order_path(order.token)
  end

  def pay_with_wechat
    # 要加权限 只能修改本人
    order = Order.find_by_token_and_user_id(params[:id], current_user.id)
    if order.pay!("WeChat")
      flash[:notice] = "Pay Successfully."
    else
      flash[:alert] = "Pay Faild"
    end
    redirect_to order_path(order.token)
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)

  end

end
