class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def join
    @product = Product.find(params[:id])

    if !current_user.is_member_of?(@product)
      current_user.join!(@product)
      flash[:notice] = "成功加入收藏夹！"
    else
      flash[:warning] = "已加入收藏夹！"
    end

    redirect_to product_path(@product)
  end

  def quit
    @product = Product.find(params[:id])

    if current_user.is_member_of?(@product)
      current_user.quit!(@product)
      flash[:alert] = "已从收藏夹中移除！"
    else
      flash[:warning] = "还未加入收藏夹！"
    end

    redirect_to product_path(@product)
  end

end
