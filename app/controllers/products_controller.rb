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
      flash[:notice] = "Succeeded to Add #{@product.title} to Cart"
    else
      flash[:warning] = "You have already added this to cart!"
    end
    redirect_to :back
  end

end
