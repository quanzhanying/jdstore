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
	

  def add_to_cart
    @product = Product.find(params[:id])
       current_cart.add_product_to_cart(@product)
    redirect_to :back
  end
  

  private

  def product_params
    params.require(:product).permit(:title, :description,  :wage_upper_bound, :wage_lower_bound)
  end

end
