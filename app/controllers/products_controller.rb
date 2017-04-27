class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@prduct.title}加入购物车"
    else
      flash[:warning] = "此商品已在购物车内"
    end
    redirect_to :back
  end
end
