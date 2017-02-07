class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, nitice: "Product created!"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path, alert: "Product updated!"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to products_path, warning: "Product deleted!"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end
end
