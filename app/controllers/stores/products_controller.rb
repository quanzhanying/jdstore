class Stores::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to stores_products_path, notice: "You've add a product! "
      else
        render :new
      end
  end

  def show

  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to stores_products_path, notice: "Updated!"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to stores_products_path, alert: "Destroyed!"
  end

  private

  def product_params
    params.require(:product).permit(:title, :money, :storage, :description)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
