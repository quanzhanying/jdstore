class ProductsController < ApplicationController
before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy]

  def index
    @products = Product.all

 end

 def show
    @product = Product.find(params[:id])
  end


end
