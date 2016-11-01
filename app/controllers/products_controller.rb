class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
    @product = Product.find(params[:id])
		if @product.quantity > 0
    cart_item = current_cart.cart_items.where(product_id: @product.id).first
			if cart_item
				cart_item.quantity = cart_item.quantity + 1
				if cart_item.quantity <= @product.quantity
					cart_item.save
				else
					flash[:alert] = "We're sorry but you have already selected the maximum number of items in stock."
				end
			else
				current_cart.add_product_to_cart(@product)
			end
		else
			flash[:alert] = "We're sorry but the selected item has been sold out."
		end
    redirect_to :back
  end

	# def remove_from_cart
  #   @product = Product.find(params[:id])
  #   current_cart.remove_product_from_cart(@product)
  #   redirect_to :back
  # end

end
