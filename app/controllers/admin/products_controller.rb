class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id] }
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
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def recommend
    @product = Product.find(params[:id])
    @product.recommend!
    redirect_to :back
  end

  def cancel_recommend
    @product = Product.find(params[:id])
    @product.cancel_recommend!
    redirect_to :back
  end
  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id, :is_recommended)
  end
end
