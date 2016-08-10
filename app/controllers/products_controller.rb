class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])

  end

  def index
    @products = Product.all

  end

  def add_to_cart
    @product = Product.find(params[:id])

    if @product.quantity > 0
      if current_cart.products.include?(@product)
        flash[:warning] = "Already in cart"
      else
        @product.quantity
      end

      current_cart.add_product_to_cart(@product)
    end

    redirect_to :back

  end

end
