class ProductsController < ApplicationController
before_action :authenticate_user! , only: [:new]

  def index
    @products =Product.all
    flash[:notice]="welcome to JD"

  end

  def show
    @product=Product.find(params[:id])
  end


  def add_to_cart
    @product=Product.find(params[:id])
    redirect_to :back
    flash[:notice]="加入购物车"
  end
  
end
