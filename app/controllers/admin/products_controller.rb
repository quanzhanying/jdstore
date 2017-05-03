class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to admin_products_path, alert: "添加商品成功"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, alert: "编辑商品成功"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "删除商品成功"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image)
  end
end
