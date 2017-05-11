class ProductsController < ApplicationController
def index
  @products = Product.all
end

def show
  @Product = Product.find(params[:id])
end

end
