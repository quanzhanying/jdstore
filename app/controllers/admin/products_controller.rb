class Admin::ProductsController < ApplicationController
    before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
    before_filter :require_is_admin

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Product create success!"
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
      redirect_to admin_products_path, warning: "Product update success!"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "Product deleted!"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price,)
  end
end
