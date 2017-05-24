class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product =  Product.find(params[:id])
    if(@product.quantity > 0 )
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "Success to add product to shopcart"
      redirect_to :back
    end
  end

  def remove_from_cart
    @product =  Product.find(params[:id])
    current_cart.remove_product_from_cart(@product)
    flash[:notice] = "Success to remove product from shopcart"
    redirect_to :back
  end

end
