class Admin::OrdersController < ApplicationController

	layout "admin"

	def index
		@orders = Order.all
	end

	def edit
	end

	def update
		@order = Order.find(params[:id])
		if @order.status == "PAID"
			@order.status = "DELIVERING"
		# elsif @order.status == "DELIVERING"
		# 	@order.status = "DELIVERED"
		# else
		# 	redirect_to orders_path, notice: "Order Update Failed"
		end
		@order.save
		redirect_to admin_orders_path, notice: "更新订单成功"
	end



	def destroy
	end

end
