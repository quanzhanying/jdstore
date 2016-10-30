class CartsController < ApplicationController


	before_action :authenticate_user!

	def index
		# @cart = current_cart
		@cart_items = current_cart.cart_items.where(order_id: nil)
	end











end
