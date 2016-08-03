class ProductsController < ApplicationController
  def index
    @products = Product.where(is_on_shelf:true)
  end
end
