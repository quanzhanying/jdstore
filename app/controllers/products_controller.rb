class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
	

  
  

  private

  def product_params
    params.require(:product).permit(:title, :description,  :wage_upper_bound, :wage_lower_bound)
  end

end
