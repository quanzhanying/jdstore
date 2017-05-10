class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
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
      flash[:notice] = "Add #{@product.title} to cart successfully!"
    else
      flash[:warning] = "It's already in your cart"
    end
    redirect_to :back
  end

end
