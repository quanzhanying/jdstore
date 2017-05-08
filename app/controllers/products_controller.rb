class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back
    flash[:notice] = "test"
  end

end
