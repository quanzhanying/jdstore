class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_is_admin
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
		@product = Product.create(product_params)
		if @product.save
			redirect_to admin_products_path, notice: "Create a new product"
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
			redirect_to admin_products_path, notice: "Update successfully"
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path, alert: "Product Deleted"
	end

	def publish
		@product = Product.find(params[:id])
		@product.publish!
		redirect_to admin_products_path
	end

	def hide
		@product = Product.find(params[:id])
		@product.hide!
		redirect_to admin_products_path
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :price, :storage, :image)
	end	

	def require_is_admin
		if !current_user.is_admin
			redirect_to products_path
		end
	end
end
