class ProductsController < ApplicationController

   def index
     @products = Product.all
   end

    def add_to_cart
      @product = Product.find(params[:id])
      redirect_to :back
      current_cart.add_product_to_cart(@product)
    end

    def show
      @product = Product.find(params[:id])
    end

end
