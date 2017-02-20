class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if @product.quantity.present? && @product.quantity > 0
      if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "成功将#{@product.title}加入购物车！"
        redirect_to :back
      else
        flash[:notice] = "该商品已经加入购物车了。"
        redirect_to :back
      end
    else
      flash[:warning] = "该商品已经没有库存了！"
      redirect_to :back
    end
  end

end
