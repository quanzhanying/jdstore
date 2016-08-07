class ProductsController < ApplicationController
  def index
    @products = Product.all.is_publish
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if @product.quantity > 0
      current_cart.add_product_to_cart(@product)
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "The product is sold out, please choose others."
      redirect_back(fallback_location: root_path)
    end
  end
end
