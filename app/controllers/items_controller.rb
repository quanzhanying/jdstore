class ItemsController < ApplicationController


	def index
		@items = Item.all.order("created_at DESC")
	end

	def show
		@item = Item.find(params[:id])
	end

	def add_to_cart
		@item = Item.find(params[:id])
		if @item.quantity > 0
			current_cart.add_item_to_cart(@item)
			@item.quantity_decrease(1)
			@item.save
			flash[:alert] = @item.quantity
		else
			flash[:alert] = "Out of Store"
		end

		redirect_to :back
	end

	def remove_from_cart
		@cart_item = CartItem.find(params[:id])
		current_cart.remove_item_from_cart(@cart_item)
		@cart_item.item.quantity_increase(1)
		@cart_item.item.save
		flash[:alert] = @cart_item.item.quantity

		redirect_to :back
	end
	
end
