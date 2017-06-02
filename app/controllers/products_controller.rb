class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_wish_list, :delete_from_wish_list]
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).where(:is_hidden => false).order("position ASC") #加入where(:is_hidden => false) 首页看不到下架商品
  end

  def show
    @product = Product.find(params[:id])
    if @product.is_hidden
      flash[:warning] = "此商品已下架"
      redirect_to root_path    #限制普通用户之间输入下架的产品网址
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    # redirect_to :back
    # flash[:notice] = "测试加入购物车" //第一次
    if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
    # flash[:notice] = "成功加入购物车" ／／第二次修改
        flash[:notice] = "你已成功将#{@product.title} 加入购物车"
    else
        flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  def add_to_wish_list
    @product = Product.find(params[:id])
    if !current_user.is_favorites?(@product)
      current_user.favorites!(@product)
      flash[:notice] = "加入心愿单成功！"
    else
      flash[:warning] = "您的心愿单已有该商品！"
    end
    redirect_to :back
  end

  def delete_from_wish_list
    @product = Product.find(params[:id])
    if current_user.is_favorites?(@product)
      current_user.nonfavorites!(@product)
      flash[:alert] = "已移出心愿单！"
    else
      flash[:warning] = "该商品还未加入心愿单，不能移出！"
    end
    redirect_to :back
  end


end
