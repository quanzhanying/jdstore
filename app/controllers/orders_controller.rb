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
		 current_cart.cart_items.each do |item|
			item.destroy
		 end
		 OrderMailer.notify_order_placed(Order.last).deliver!
		 redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

	def show
		@order = Order.find_by_token(params[:id])
		@product_lists = @order.product_lists
	end

	def pay_with_wechat
		@order = Order.find(params[:id])
			@order.paid_wechat!
			@order.make_payment!
			flash[:notice] = "Thank you for your order! We will be in touch shortly."

			redirect_to :root
	end

	def pay_with_alipay
		@order = Order.find(params[:id])
		@order.paid_alipay!
		@order.make_payment!
		flash[:notice] = "Thank you for your order! We will be in touch shortly."

		redirect_to :root
	end

	def ask_cancel
		@order = Order.find_by_token(params[:id])
		OrderMailer.user_wants_cancel(Order.last).deliver!
		flash[:notice] = "Your cancellation request has been placed. We will be in touch shortly."
	end



  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end

end
