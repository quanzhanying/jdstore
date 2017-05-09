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
  if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
       flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
     else
       flash[:warning] = "你的购物车内已有此物品"
     end
  redirect_to :back
end

end
