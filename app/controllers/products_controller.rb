class ProductsController < ApplicationController
    before_action :validates_search_key, only: [:search]
    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def add_to_cart
        @product = Product.find(params[:id])
        if !current_cart.products.include?(@product)
            current_cart.add_product_to_cart(@product)
            flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
        else
            flash[:warning] = '你的购物车内已有此物品'
      end
        redirect_to :back
    end

    protected

    def validates_search_key
        @q = params[:query_string].gsub(/\\|\'|\/|\?/, '') if params[:query_string].present?
    end

    def search
        @products = Product.ransack(title_or_description_or_price_or_quantity_image_name_cont: @q).result(distinct: true)
end
end
