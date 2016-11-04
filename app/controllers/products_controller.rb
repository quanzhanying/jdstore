class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
   @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
      if @product.id>0
       current_cart.add_product_to_cart(@product)
       redirect_to :back
      else
      flash[:alert] = "库存为零"
      redirect_to :back
      end
  end

  def destroy_to_cart
    @product = Product.find(params[:id])
    current_cart.destroy_product_to_cart(@product)
    redirect_to :back
  end

end
