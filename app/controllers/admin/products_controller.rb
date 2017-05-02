class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "产品新建成功！"
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
