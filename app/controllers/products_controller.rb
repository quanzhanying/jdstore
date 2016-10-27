class ProductsController < ApplicationController

    def index
      @products = Product.published
    end

    def show
      @product = Product.find(params[:id])
    end


    def new
      @product = Product.new
    end

    private

    def product_params
      params.require(:product).permit(:title, :description, :quantity, :price, :image)
    end

end
