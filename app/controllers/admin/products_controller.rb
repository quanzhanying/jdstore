class Admin::ProductsController < ApplicationController


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save

    redirect_to products_path
  end



end
