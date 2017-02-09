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
    current_cart.add_product_to_cart(@product)
  flash[:notice]="成功加入购物车"
    redirect_to :back

  end

end
