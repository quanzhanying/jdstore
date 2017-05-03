class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destory]
  before_action :require_is_admin

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
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destory
    @product = Product.find(params[:id])
    @product.destory
    redirect_to admin_products_path
  end




  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

end
