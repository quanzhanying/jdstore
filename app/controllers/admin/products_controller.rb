class Admin::ProductsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_is_admin

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

    if @product.save!
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

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin!'
      redirect_to root_path
    end
  end

  def publish
    @job = Product.find(params[:id])
    @job.is_hidden = false
    @job.save
    redirect_to :back
  end

  def hide
    @job = Product.find(params[:id])
    @job.is_hidden = true
    @job.save
    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :store, :is_hidden, :attachment)
  end

end
