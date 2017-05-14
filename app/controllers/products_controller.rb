class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    unless current_cart.products.include?(@product)
      if @product.quantity == 0
        flash[:alert] = '已售罄，无法购买'
      end
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功将#{@product.title}加入购物车"
    else
      flash[:warning] = '购物车中已有此物品'
    end
    redirect_to :back
  end

  private
    
end
