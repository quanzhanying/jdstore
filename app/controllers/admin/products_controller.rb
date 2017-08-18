class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      rander :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
