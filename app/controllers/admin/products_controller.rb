class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:alert] = "成功添加商品"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product =  Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:alert] = "成功更新商品"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description,:price, :quantity)
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "您没有管理员权限，无法访问本页面"
      redirect_to root_path
    end
  end

end
