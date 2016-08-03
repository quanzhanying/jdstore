class Admin::ProductsController < ApplicationController

    def index
      @products=Product.all
      # @product.user=current_user
    end

    def new
      @product=Product.new
      @product.user=current_user
    end

    def create
      @product=Product.new(params_product)
      @product.save

    end

    private

    def params_product
      params_product.require(:product).permit(:title, :description, :quantity, :price, :image)
    end


end
