class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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
			redirect_to admin_products_path, notice: "Product Created."
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
			redirect_to admin_products_path, notice: "Product Updated."
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])

		@product.destroy
		redirect_to admin_products_path, alert: "Product Deleted."
	end

	def admin_required
		if !current_user.try(:admin?)
		#if !current_user.admin?
			flash[:alert] = 'You are not admin' 
			redirect_to "/" 
		end
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price, :photo)
	end
end
