class CartsController < ApplicationController


  def checkout
    @order = Order.new
  end

	def remove_all_item_from_cart

		current_cart.remove_all_item

		flash[:alert] = "Remove All Item"
		redirect_to :back

	end

end
