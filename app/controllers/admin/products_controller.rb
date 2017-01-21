class Admin::ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admin_products_path, notice: "Successfully created a product!"
        else
            render :new
        end
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to admin_products_path, alert: "Update Success!"
        else
            render :edit
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path, warning: "Product deleted!"
    end

    private

    def product_params
        params.require(:product).permit(:title, :description, :quantity, price)
    end
end
