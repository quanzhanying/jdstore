class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
    @product = Product.find(params[:id])
  end

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end


def edit
  @produt = Product.find(params[:id])
end

def update
  @produt = Product.find(params[:id])
  if @produt.update(product_params)
    redirect_to admin_jobs_path
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
