class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:collect, :un_collect]

  def index
    @products = Product.all.order("position ASC")
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

  def collect
    @product = Product.find(params[:id])

    if !current_user.is_collect_of?(@product)
      current_user.collect!(@product)
      flash[:notice] = "已收藏该商品"
    else
      flash[:warning] = "你已经收藏过该商品了"
    end

    redirect_to product_path(@product)
  end

  def un_collect
    @product = Product.find(params[:id])

    if current_user.is_collect_of?(@product)
      current_user.un_collect!(@product)
      flash[:notice] = "已取消收藏该商品"
    else
      flash[:warning] = "你还没有收藏该商品"
    end

    redirect_to product_path(@product)
  end

end
