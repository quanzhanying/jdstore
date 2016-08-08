class CartsController < ApplicationController


	def remove_all_item_from_cart

		current_cart.cart_items.each do |cart_item|
			current_cart.remove_item_from_cart(cart_item)
			cart_item.item.quantity_increase(1)
			cart_item.item.save
		end

		flash[:alert] = "His"
		redirect_to :back

	end

end
