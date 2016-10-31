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

    def add_to_cart
      @product = Product.find(params[:id])
      current_cart.add_product_to_cart(@product)
      redirect_to :back
    end

    private

    def product_params
      params.require(:product).permit(:title, :description, :quantity, :price, :image)
    end

end
