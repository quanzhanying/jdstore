class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required


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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(product_params)
    if @product.update
      redirect_to admin_products_path, notice: "You have updated"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "You have deleted it "
  end



  private
  def product_params
    params.require(:product).permit(:title, :quantity, :price, :description)
  end
end
