class Admin::ProductsController < ApplicationController



  def index
    @products = Product.all
  end
  

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice:'Added!'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.upadte(prodcut_params)
      redirect_to admin_products_path, notice:"edited!"
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
