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
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功将#{@product.title}加入购物车"
    else
      flash[:warning] = "你的购物车已经有此物"

    end
    redirect_to :back
  end

end


private
def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end
