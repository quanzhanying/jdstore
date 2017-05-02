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

  private
  def product_params
    params.require(:product).permit(:name, :description, :stock, :price, :can_sell, :image)
  end
end
