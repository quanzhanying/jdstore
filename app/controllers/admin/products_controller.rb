class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  before_action :find_product_before_action, only: [:edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "add product success"
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @product.update(product_params)
      redirect_to admin_products_path, notice: "edit product success"
    else
      render :edit
    end
  end

  def destroy

    @product.delete
    redirect_to admin_products_path, alert: "delete product success"
  end

  private

  def find_product_before_action
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :is_hidden, :image)
  end

end
