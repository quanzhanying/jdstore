class ProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])

  end


  def index
    @products = Product.all
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
    @product = product.find(params[:id])
  end

  def update
    @product = product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = product.find(params[:id])

    @product.destroy

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image)
  end
end
