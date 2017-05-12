class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :show]
  def index
    @products = Product.where(can_sell: true)
  end

  def show
    @product = Product.find(params[:id])
    if @product.can_sell = false
      redirect_to root_path
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
    flash[:notice] = "成功加入购物车"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :stock, :price, :can_sell, :image)
  end
end
