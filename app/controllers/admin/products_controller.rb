class Admin::ProductsController < ApplicationController
layout "admin"
before_action :authenticate_user!
before_action :admin_required
before_action :require_is_admin

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
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
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end

  def require_is_admin
  if !current_user.admin?
    flash[:alert] = 'You are not admin'
    redirect_to root_path
  end
end
end
