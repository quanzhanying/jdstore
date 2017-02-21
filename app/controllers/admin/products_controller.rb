class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  # 首页 R
  def index
    @products = Product.all
  end

  # 查看 R
  def show
    @product = Product.find(params[:id])
  end

  # 新建 C
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to account_products_path
    else
      flash[:alert] = '请填写完整数据！'
      render :new
    end
  end

  # 编辑 U
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "数据已更新！"
    else
      render :edit
    end
  end

  # 删除 D
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "该宝贝已删除！"
    redirect_to admin_products_path
  end

  # private def
  private
    def product_params
      params.require(:product).permit(:title, :description, :quantity, :price, :image)
    end
end
