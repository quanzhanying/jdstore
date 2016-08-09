class ProductsController < ApplicationController
  before_action :authenticated_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
	
  def create
    @product = Product.new(job_params)

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

  private

  def product_params
    params.require(:job).permit(:title, :description)
  end

end
