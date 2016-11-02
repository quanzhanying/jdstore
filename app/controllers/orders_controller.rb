class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  # def index
  #   @orders = Order.all
  # end
  #
  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end
  #
  # def new
  #   @order = Order.new
  # end

  # def create
  #   @order = Order.new(order_params)
  #
  #   if @order.save
  #     redirect_to orders_path
  #   else
  #     render :new
  #   end
  # end

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
      render "carts/checkout"
    end
  end

  private
  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end


#   def edit
#     @order = Order.find(params[:id])
#   end
#
#   def update
#     @order = Order.find(params[:id])
#
#     if @order.update(order_params)
#       redirect_to orders_path
#     end
#   end
#
#   def destroy
#     @order = Order.find(params[:id])
#     @order.destroy
#     redirect_to orders_path
#   end
#
#   private
#   def order_params
#     params.require(:order).permit(:product, :price, :quantity)
#   end
# end
