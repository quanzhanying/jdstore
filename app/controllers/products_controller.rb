class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.where(:is_hidden => false).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def add_to_cart
     @product = Product.find(params[:id])
     current_cart.add_product_to_cart(@product)
     redirect_to :back
     flash[:notice] = "测试加入购物车"
   end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :is_hidden)
  end
end
