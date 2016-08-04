class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  layout "admin"

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
      redirect_to admin_products_path, notice: "add product success."
    else
      render "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "product updated success."
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "product deleted success."
  end

  def publish
    @product = Product.find(params[:id])
    if @product.publish!
      redirect_to admin_products_path, notice: "product publish success."
    else
      redirect_to admin_products_path, alert: "product publish faild."
    end
  end

  def hide
    @product = Product.find(params[:id])
    if @product.hide!
      redirect_to admin_products_path, notice: "product hide success."
    else
      redirect_to admin_products_path, alert: "product hide faild."
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

end
