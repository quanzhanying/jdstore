class CartsController < ApplicationController
	def clean
		current_cart.clean!
		redirect_to carts_path,warning:"Empty Successfully !"
	end

	def checkout
		@order = Oder.new
	end
end
