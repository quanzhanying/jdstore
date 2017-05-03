class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_produt, only: [:edit, :update, :destroy]
  layout "admin"


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end


  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Add the product Successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "You have updated"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, alert: "You have deleted it "
  end



  private
  def set_produt
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :quantity, :price, :description, :image)
  end
end
