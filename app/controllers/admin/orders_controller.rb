class Admin::OrdersController < ApplicationController

	layout "admin"

	def index
		@orders = Order.all.order("created_at DESC")
	end

	def edit
	end

	def update
		# @order = Order.find(params[:id])
		# if @order.status == "PAID"
		# 	@order.status = "DELIVERING"
		# # elsif @order.status == "DELIVERING"
		# # 	@order.status = "DELIVERED"
		# # else
		# # 	redirect_to orders_path, notice: "Order Update Failed"
		# end
		# @order.save
		# redirect_to admin_orders_path, notice: "更新订单成功"
	end

	def ship
		@order = Order.find(params[:id])
		@order.ship!
		redirect_to admin_orders_path, notice: "成功发货"
		OrderMailer.order_ship_email(@order.user, @order).deliver
	end

	def cancel
		@order = Order.find(params[:id])
		@order.cancell_order!
		redirect_to admin_orders_path, notice: "取消订单"
		OrderMailer.order_cancel_email(@order.user, @order).deliver
	end

	def destroy
	end

end
