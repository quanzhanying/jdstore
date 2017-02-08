class ProductsController < ApplicationController
    # 首页 R
    def index
        @products = Product.all
    end

    # 查看 R
    def show
        @product = Product.find(params[:id])
    end

    def add_to_cart
        @product = Product.find(params[:id])
        redirect_to :back
        flash[:notice] = '测试加入购物车'
    end
end
