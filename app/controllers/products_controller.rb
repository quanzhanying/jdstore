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
      #@product.quantity_reduce(1)
      flash[:notice] = "#{@product.title} add to cart success..."
    else
      flash[:warning] = "your cart has the product #{@product.title}"
    end
    redirect_to :back
  end
end
