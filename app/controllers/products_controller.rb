class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    def show
        @product = Product.find(params[:id])
    end

    def add_to_cart
        @product = Product.find(params[:id])
        if @product.quantity > 0
          current_cart.add_product_to_cart(@product)
          redirect_to :back
        else
          redirect_to :back, alert: "抱歉，商品数量小于1"
        end
    end



end
