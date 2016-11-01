class CartsController < ApplicationController

	def create
		@cart = Cart.create
	end

	# def destroy
	# 	@cart = Cart.find(params[:id])
	# 	@cart.destroy
	# 	redirect_to products_path, alert: "Cart Cleared."
	# end

	def checkout
		@order = Order.new
	end
	

end
