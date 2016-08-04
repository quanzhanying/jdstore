class Admin::ProductsController < ApplicationController

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      @product.user = current_user
      
      if @product.save!
        redirect_to admin_products_path
      else
        render :new
      end

    end

    def index
      @products = Product.all
    end
    private

    def product_params
      params.require(:product).permit(:title, :description , :quantity, :image , :price , :is_hidden)

    end
end
