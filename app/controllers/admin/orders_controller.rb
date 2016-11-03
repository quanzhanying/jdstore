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

end
