class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    def show
        @product = Product.find(params[:id])
    end

    def add_to_cart

        @product = Product.find(params[:id])
        if @product.quantity == 0
          flash[:alert] = "抱歉，商品数量小于1"
        end

        if current_cart.products.include?(@product)
        # @cart_item = CartItem.find_by(product_id: @product.id, cart_id: current_cart.id)
          flash[:alert] = "已加入购物车了"
        else
          current_cart.add_product_to_cart(@product)

          flash[:notice] = "成功加入购物车"
        end

        redirect_to :back
    end



end
