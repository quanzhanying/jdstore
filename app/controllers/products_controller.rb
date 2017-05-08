class ProductsController < ApplicationController
def index
  @products = Product.all
end

def show
  @product = Product.find(params[:id])
end

def add_to_cart_product_path
  @product = Product.find(params[:id])
  redirect_to :back
  flash[:notice] = "测试加入购物车"
end

end
