class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.category_id = params[:category_id]
    if @product.save
      redirect_to admin_products_path, alert: "添加商品成功"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
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
    params.require(:product).permit(:name, :description, :price, :stock, :can_sell, :image)
  end
end
