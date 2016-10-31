class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to admin_prodcuts_path
    else
      render :back
    end

  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
