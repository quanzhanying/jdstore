class ProductsController < ApplicationController

	def index
		# @products = Product.all
		if params[:search]
			@products = Product.search(params[:search]).order("created_at DESC")
		else
			@products = Product.all.order("created_at DESC")
		end

		unless @products.any?
			render :no_result
		end

	end

	def no_result

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
