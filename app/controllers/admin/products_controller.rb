class Admin::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_admin
  layout "admin"

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
      flash[:notice] = "商品添加成功"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
      flash[:notice] = "商品信息修改成功"
    else
      render "edit"
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
    flash[:warning] = "商品已删除"
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,:description,:price,:quantity)
  end

end
