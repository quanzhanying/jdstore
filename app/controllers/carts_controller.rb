class CartsController < ApplicationController
	def clean
		current_cart.clean!
		flash[:warning] = "已清空整个购物车"
		redirect_to carts_path
	end

	def checkout
		@order = Order.new
	end
end
