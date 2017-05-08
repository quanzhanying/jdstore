class ProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end
  def index
    @products = Product.all
  end
  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back
    flash[:notice] = "测试加入购物车"
  end


end
private
def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end
