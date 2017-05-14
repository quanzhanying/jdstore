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
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.name} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :stock, :price, :can_sell, :image)
  end
end
