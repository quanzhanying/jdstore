class ProductsController < ApplicationController
    def index
      @products = Product.all
      if params[:search]
        @products = Product.search(params[:search]).order("created_at DESC")
      else
        @products = case params[:cate]
        when 'jujia'
          @products = Product.all.where(:categories => '居家')
        when 'canchu'
          @products = Product.all.where(:categories => '餐厨')
        when 'peijian'
          @products = Product.all.where(:categories => '配件')
        when 'fuzhuang'
          @products = Product.all.where(:categories => '服装')
        when 'xihu'
          @products = Product.all.where(:categories => '洗护')
        when 'yingtong'
          @products = Product.all.where(:categories => '婴童')
        when 'yinshi'
          @products = Product.all.where(:categories => '饮食')
        when 'zahuo'
          @products = Product.all.where(:categories => '杂货')
        when 'qita'
          @products = Product.all.where(:categories => '其他')
        else
          @products = Product.all.order("created_at DESC")
        end
      end
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
            flash[:warning] = "你的购物车内已有此物品"
        end
        redirect_to :back
    end

end
