class Admin::ProductsController < ApplicationController
  def show
    @product = Product.find([:product_id])
  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find([:product_id])
  end

  def create
    @product = Product.create(param_product)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def update
    @product = Product.update(param_product)
    if @product.save
      redirect_to admin_product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
  end

  private

  def param_product
    required.parameters([:title, :description, :quantity, :price])
  end
end
