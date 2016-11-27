class Account::OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		@orders = current_user.orders
	end

	# def show
	# 	@order = current_user.orders


	def show
		@order = Order.find(params[:id])
		# @product_lists = Order.product_list
	end

end
