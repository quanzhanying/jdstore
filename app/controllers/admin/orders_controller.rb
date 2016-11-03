class Admin::OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
	before_action :require_is_admin

	def index
		@orders = Order.all
	end

	def destroy
		@order = Order.find_by_token(params[:id])
		@order.destroy

		redirect_to admin_orders_path, alert: "Order Deleted."
	end

	def admin_cancel_order
		@order = Order.find_by_token(params[:id])
		if @order.aasm_state === "order_cancelled"
			flash[:warning] = "Order already cancelled."
		else
		@order.cancel_order!
		flash[:alert] = "Order cancelled, customer will be notified by email."
		OrderMailer.notify_order_cancelled(Order.last).deliver!
		end

		redirect_to admin_orders_path
	end

# Step 3 - Order already paid, so admin ships order
	def admin_ships
		@order = Order.find_by_token(params[:id])
		if @order.aasm_state === "paid"
			 @order.ship!
			 flash[:notice] = "Order shipped! Customer will be notified by email."
			 OrderMailer.notify_order_shipped(Order.last).deliver!
		else
			 flash[:warning] = "Check that order status is currently 'paid'."
		end
		redirect_to admin_orders_path
	end

end
