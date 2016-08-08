class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if @product.quantity < 1
      :show
    else
      current_cart.add_product_to_cart(@product)
      redirect_to :back
    end
  end

end
