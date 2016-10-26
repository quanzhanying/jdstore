class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin


  def index
    @products = Product.all
  end

  def new
    @product = Product.new

  end

  def edit
    @produt = Product.find(prams[:id])

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice:'Product added sucessfully.'
    else
      render :new
    end
  end

  def update
    @produt = Product.find(prams[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice:'Product added sucessfully.'
    else
      render :edit
    end
  end

    def destroy
    @produt = Product.find(prams[:id])

    @product.destroy
      redirect_to    redirect_to admin_products_path, notice:'Product deleted sucessfully.'

    end

  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end


end
