class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.products.include?(@product)
    #  !current_cart.product_to_cart(@product)   我尝试的写法
       current_cart.add_product_to_cart(@product)
       flash[:notice] = "成功加入购物车！"
    else
       flash[:warning] = "你的购物车内已有此物品！"

    end
    redirect_to :back
  end

end
