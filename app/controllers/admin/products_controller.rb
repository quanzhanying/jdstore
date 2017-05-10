class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :admin_required

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
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

def destroy
  @produt = Product.find(params[:id])
  @produt.destroy
  redirect_to admin_jobs_path
end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
