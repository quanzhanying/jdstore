class CartsController < ApplicationController

	def create
		@cart = Cart.create
	end

	# def destroy
	# 	@cart = Cart.find(params[:id])
	# 	@cart.destroy
	# end

	def checkout
		@order = Order.new
	end


end
