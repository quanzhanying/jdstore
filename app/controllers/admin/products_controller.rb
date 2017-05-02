class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "商品新建成功！"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "商品修改成功！"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admin_products_path, alert: "商品已经删除！"
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
