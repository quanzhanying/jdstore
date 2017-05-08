class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back
    flash[:notice] = "测试加入购物车"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image)
  end



end
