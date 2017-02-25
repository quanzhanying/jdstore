class ProductsController < ApplicationController
  before_filter :authenticate_user!, only: [:favorite]
  def index
    @products = Product.all
  end
  def show
     @product = Product.find(params[:id])
     @photos = @product.photos.all
     if @product.iwasher?
       render 'products/iwasher'
     elsif @product.ilife?
       render 'products/ilife'
     elsif @product.mi?
       render 'products/mi'
     end

  end


  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    flash[:notice] = "你已成功将#{@product.title} 加入购物车"
  else
    flash[:warning] = "你的购物车内已有此物品"
  end
    redirect_to :back
  end

  def favorite
    @product = Product.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_products << @product
      redirect_to :back
    elsif type == "unfavorite"
      current_user.favorite_products.delete(@product)
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
