class Admin::ProductsController < ApplicationController
	before_action :find_products, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :admin_required
	layout "admin"
	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to admin_products_path, notice: "Update success"
		else
			render :edit
		end
	end

	def destroy
		@product.destroy
		redirect_to admin_products_path, alert: "Product Deleted"
	end

	private

	def find_products
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price, :image)
	end
end
