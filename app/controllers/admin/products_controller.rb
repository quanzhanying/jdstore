class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

  def index
    @products = Product.all
  end

  def new
    @product = Product.new

    render :edit
  end

  def edit
    @product = Product.find(params[:id])

    render :edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Update Successfully."
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :image, :is_published)
  end

end
