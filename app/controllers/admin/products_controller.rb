class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required

  # ---CRUD---

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
    @product.user = current_user

    if @product.save
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
      redirect_to admin_products_path
  end



  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end


  # ---private---

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end

end
