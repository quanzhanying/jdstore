class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.published.recent
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
      redirect_to products_path
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
      flash[:notice] = "Product updated."
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "Product deleted"
    redirect_to products_path
  end

  def add_to_cart
    @product = Product.find(params[:id])
    unless @product.present?
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功加入购物车"
    else
      flash[:warning] = "购物车已有该商品，无需再加入。"
    end
    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :is_hidden, :picture)
  end

end
