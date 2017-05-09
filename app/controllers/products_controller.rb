class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !@product.blank?
      redirect_to :back
    else
      flash[:warning] = "Product does't exist on store."
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
