class ProductsController < ApplicationController

    before_action :authenticate_user!, only: [:upvote, :downvote, :favorite, :unfavorite]

  def index
    @products = Product.onshelf.page(params[:page] || 1).per_page(params[:per_page] || 8).order("id desc").includes(:main_product_image)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.products.include?(@product)
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "成功將 #{@product.title} 加入購物車"
    else
      flash[:warning] = "購物車中已有該商品！"
    end

    redirect_to :back
  end

    def upvote
      @product = Product.find(params[:id])
      @product.upvote_by current_user
      redirect_to :back
    end

    def downvote
      @product = Product.find(params[:id])
      @product.downvote_by current_user
      redirect_to :back
    end

    def favorite
      @product = Product.find(params[:id])
      current_user.favorite_products << @product
      flash[:notice] = "成功珍藏此商品！"
      redirect_to :back
    end

    def unfavorite
      @product = Product.find(params[:id])
      current_user.favorite_products.delete(@product)
      flash[:notice] = "已取消珍藏此商品！"
      redirect_to :back
    end

    def search

    #在全栈商品中搜索
    @products = Product.where("title like :title", title: "%#{params[:w]}%")
      .order("id desc").page(params[:page] || 1).per_page(params[:per_page] || 12)
      .includes(:main_product_image)

    #在二级分类商品中搜索
    unless params[:category_id].blank?
      @products = @products.where(category_id: params[:category_id])
    end

    render file: 'products/index'
  end


end
