class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "Successful add #{@product.title} to cart"
    else
      flash[:warning] = "Your cart already has this item"
    end
    redirect_to :back
  end
end
