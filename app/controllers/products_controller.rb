class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
  end

	def remove_from_cart
    @product = Product.find(params[:id])
    current_cart.remove_product_from_cart(@product)
    redirect_to :back
  end

end
