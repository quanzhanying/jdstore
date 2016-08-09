class ItemsController < ApplicationController


	def index
		@items = Item.all.order("created_at DESC")
	end

	def show
		@item = Item.find(params[:id])
	end

	def add_to_cart
		@item = Item.find(params[:id])
		cart_item = CartItem.find_by_item_id(@item.id)
		if @item.quantity > 0 

			if cart_item.nil?
				current_cart.add_item_to_cart(@item)
			elsif @item.quantity > cart_item.quantity
				cart_item.quantity = cart_item.quantity + 1
				cart_item.save
			else
				flash[:alert] = "Only " + @item.quantity.to_s + " in Stock, you can't add more to your Cart"
			end

		else
			flash[:alert] = "This item is out of stock"
		end

		redirect_to :back
	end

	def remove_from_cart
		@cart_item = CartItem.find(params[:id])
		current_cart.remove_item_from_cart(@cart_item)

		redirect_to :back
	end
	
end
