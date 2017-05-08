class ProductsController < ApplicationController
before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy]

def index
if params[:category].blank?
  @products = Product.all
else
  @category_id = Category.find_by(name: params[:category]).id
  @products = Product.where(:category_id => @category_id)
end
end

 def show
    @product = Product.find(params[:id])
  end

def add_to_cart
  @product = Product.find(params[:id])

  current_cart.add_product_to_cart(@product)
  flash[:notice] = "成功加入购物车"
  redirect_to :back
end

end
