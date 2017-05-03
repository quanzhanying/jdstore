class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
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
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])

		@product.destroy
		redirect_to admin_products_path
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price, :image)
	end

	def require_admin
		if !current_user.admin?
			redirect_to "/"
		end
	end

end
