class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def show
		@product = Product.find(params[:id])
	end
	def add_to_cart
		@product = Product.find(params[:id])
		flash[:notice] = "Add to cart"
		redirect_to :back
	end
end
