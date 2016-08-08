class ItemsController < ApplicationController


	def index
		@items = Item.all.order("created_at DESC")
	end

	def show
		@item = Item.find(params[:id])
	end

	def add_to_cart
		@item = Item.find(params[:id])
		current_cart.add_item_to_cart(@item)

		redirect_to :back
	end

	def remove_from_cart
		@cart_item = CartItem.find(params[:id])
		current_cart.remove_item_from_cart(@cart_item)

		redirect_to :back
	end
	
end
