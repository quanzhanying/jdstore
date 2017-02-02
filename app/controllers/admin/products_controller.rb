class Admin::ProductsController < ApplicationController
  before_action: authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "Product Created."
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
      redirect_to admin_products_path, notice: "Product Updated."
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permist(:title, :description, :quantity, :price)
  end
end
