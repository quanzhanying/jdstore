class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end




  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end



end
