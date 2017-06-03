class ProductsController < ApplicationController
before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy]

def index
if params[:category].blank?
  @products = Product.all
else
  @category_id = Category.find_by(name: params[:category]).id
  @products = Product.where(:category_id => @category_id)
end
end

 def show
    @product = Product.find(params[:id])
  end


end
