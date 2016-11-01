class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.where(product_id: @product.id).first
			if cart_item
				cart_item.quantity = cart_item.quantity + 1
				cart_item.save
			else
				current_cart.add_product_to_cart(@product)
			end
    redirect_to :back
  end

	# def remove_from_cart
  #   @product = Product.find(params[:id])
  #   current_cart.remove_product_from_cart(@product)
  #   redirect_to :back
  # end

end
