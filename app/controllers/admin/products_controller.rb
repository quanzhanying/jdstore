class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all

  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
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
      @product.category_id = params[:category_id]
      if @product.update(product_params)
        redirect_to admin_products_path
      else
        render :edit
      end
  end



  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :category_id)
  end
end
