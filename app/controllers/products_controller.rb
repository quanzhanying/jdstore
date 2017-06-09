class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:like, :unlike]
  def index
    if params[:category].blank?
      @products = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id).order("created_at DESC")
    end
end


  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "你已经成功讲 #{@product.title} 加入购物车"
  else
    flash[:warning] = "你的购物车内已有此物品"
  end
    redirect_to :back
  end
  def like
  @product = Product.find(params[:id])
  if !current_user.is_like?(@product)
      current_user.like!(@product)
      flash[:notice] = "收藏商品成功！"
   else
      flash[:warning] = "你已经收藏过本商品了！"
   end
    redirect_to product_path(@product)
end

def unlike
  @product = Product.find(params[:id])
  if current_user.is_like?(@product)
      current_user.unlike!(@product)
      flash[:notice] = "取消收藏商品！"
   else
      flash[:warning] = "你没有收藏过商品，如何取消 XD！"
   end
    redirect_to product_path(@product)
end
end
