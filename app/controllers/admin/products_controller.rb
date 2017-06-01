class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def admin_required
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  def index
    @products = Product.all.order("position ASC")
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path，notice: 'Update Success'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :back
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

#后台商品排序功能
  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end
end
