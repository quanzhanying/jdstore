class ProductsController < ApplicationController
  def index
    @products = Product.where(is_on_shelf:true)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if @product.quantity>0 
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "加入购物车成功"
    else
      flash[:alert] = "此商品被抢光了哦"
    end

    redirect_to :back
  end
end
