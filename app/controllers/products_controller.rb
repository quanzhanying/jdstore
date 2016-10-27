class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@other_products = Product.all[1,2]
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :price, :quantity, :image)
	end
end
