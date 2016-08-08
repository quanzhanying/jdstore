class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if @product.quantity >0
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "已加入购物车"
    else
      flash[:alert] = "已售罄"

    end
    redirect_to :back
  end

end

private
def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end
