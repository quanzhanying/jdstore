class Admin::ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  # before_action must login!
   before_filter :require_is_admin
  # only admin can into back platform!
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
      redirect_to admin_products_path
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
      redirect_to admin_products_path, notice: "产品更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to admin_products_path, alert: '产品删除成功！'
  end

  def require_is_admin
      if !current_user.admin?
        flash[:alert] = 'You are not admin!'
        redirect_to root_path
      end
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)

  end
end
