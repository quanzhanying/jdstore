class CartsController < ApplicationController


	def remove_all_item_from_cart

		current_cart.cart_items.delete_all

		flash[:alert] = "Remove All Item"
		redirect_to :back

	end

end
