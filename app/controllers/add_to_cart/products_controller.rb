class AddToCart::ProductsController < ApplicationController

  def index
    @products = Product.all
  end
end
