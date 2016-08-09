class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price #total_price是cart的model中的方法，返回值为总价

    if @order.save
      save_product_list
      redirect_to order_path(@order)
    else
      render 'carts/checkout' # 调用carts下面的checkout页面，调用template
    end

  end

  def save_product_list
    current_cart.cart_items.each do |cart_item|
      product_list = ProductList.new
      product_list.order = @order # 确定了show里面的@product_lists
      product_list.product_name = cart_item.product.title
      product_list.product_price = cart_item.product.money
      product_list.quantity = cart_item.quantity
      product_list.save
    end
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
