class CartsController < ApplicationController


	before_action :authenticate_user!

	def index
		# @cart = current_cart
		@cart_items = current_cart.cart_items.where(order_id: nil)
	end

	def empty_cart
		cart_id = params[:cart_id]
		CartItem.where(cart_id: cart_id).where(order_id: nil).delete_all
		redirect_to :back, notice: "已经清除购物车"
	end











end
