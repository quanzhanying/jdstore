class OrdersController < ApplicationController

	before_action :authenticate_user!, only: [:create]

# Step 1 - Order created
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

# Step 2 - Order paid (by user)
	def pay_with_wechat
		@order = Order.find(params[:id])
		if @order.is_paid === false
			@order.paid_wechat!
			@order.make_payment!
			flash[:notice] = "Thank you for your order! We will be in touch shortly."
		else
			flash[:warning] = "You have already paid for your order."
		end
			redirect_to :root
	end

	def pay_with_alipay
		@order = Order.find(params[:id])
		if @order.is_paid === false && @order.aasm_state === "order_placed"
			@order.paid_alipay!
			@order.make_payment!
			flash[:notice] = "Thank you for your order! We will be in touch shortly."
		else
			flash[:warning] = "You have already paid for your order."
		end
		redirect_to :root
	end

# Step 4 - User receives shipment, changes status to received ("shipped" for admin view)
	def user_received
		@order = Order.find_by_token(params[:id])
		if @order.aasm_state === "shipping"
			 @order.deliver!
			 flash[:notice] = "Thank you confirming receipt of the order. We hope you enjoyed shopping at DZF!"
		else
			flash[:warning] = "You may only confirm shipment once the product has been shipped."
		end
		redirect_to :back
	end

	def user_returns
		@order = Order.find_by_token(params[:id])
		if @order.aasm_state === "shipped"
			@order.return_good!
			OrderMailer.user_wants_return(Order.last).deliver!
			flash[:warning] = "We have received your request. Our customer services rep will be in touch shortly."
		else
			flash[:warning] = "You may only return goods that have been shipped (received)."
		end
		redirect_to :back
	end


	def ask_cancel
		@order = Order.find_by_token(params[:id])
		if @order.aasm_state == "order_placed" || @order.aasm_state ==  "paid"
		OrderMailer.user_wants_cancel(Order.last).deliver!
		flash[:warning] = "Your cancellation request has been placed. We will be in touch shortly."
		else
		flash[:warning] = "Your order has already been shipped, you may return the goods once it's received."
		end
		redirect_to :back
	end


  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end

end
