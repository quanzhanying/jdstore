class CartItemsController < ApplicationController

	before_action :authenticate_user!
	def destroy
		@cart = current_cart
		@cart_item = @cart.cart_items.find_by(product_id: params[:id])
		@product = @cart_item.product
		@cart_item.destroy

		redirect_to :back,warning: "#{@product.title} is deleted from cart!"
		
	end


end
