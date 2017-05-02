class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def show
    @product = Product.find(params[:id])
  end
  def index
    @products = Product.all
  end


end
private
def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end
