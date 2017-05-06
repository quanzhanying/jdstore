class Admin::ProductsController < ApplicationController
	layout "admin"

	before_action :authenticate_user!
	before_action :admin_required

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_products_path
		else
			render_to :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def updete
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to product_path
		else
			render_to :edit
		end
	end

	def destory
		@product = Product.find(params[:id])
		@product.destrory
		redirect_to product_path
	end

	private
	def product_params
		params.require(:product).permit(:title, :description, :price, :quantity, :image)
	end
end
