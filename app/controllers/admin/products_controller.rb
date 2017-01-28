class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @products = Product.all
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
      flash[:notice] = "Success Created"
      redirect_to admin_products_path
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
      redirect_to admin_products_path
    else
      render :edit
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "Product Deleted"
    redirect_to admin_products_path
  end


  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin"
    end
  end
  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quanlity, :image)
  end


end
