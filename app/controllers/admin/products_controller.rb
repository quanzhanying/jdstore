class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :require_is_admin

 layout "admin"

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice]="create product successful"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:notice]="update successful"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy

    redirect_to admin_products_path
  end


  private

  def product_params
    # params.require(:product).permit(:title, :description, :quantity, :price)
    params.require(:product).permit(:title, :description, :quantity, :price, :image)

  end
end
