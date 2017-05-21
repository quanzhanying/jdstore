class ProductsController < ApplicationController

  #只有按position栏位排序，gem 'acts_as_list'才起作用，调整产品位置
  def index
    @products = Product.all.order("position asc")
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @comments = @product.comments 
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车已有此商品"
    end
    redirect_to :back
  end
end
