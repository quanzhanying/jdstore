class Admin::ProductsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
before_action :admin_required
layout "admin"

  def index
    @products = Product.all.order("position ASC")
  end

def show
  @products = Product.find(params[:id])
end

def new
  @product = Product.new
end

def edit
  @product = Product.find(params[:id])
end

def create
  @products = Product.new(product_params)
  if @products.save
    redirect_to admin_products_path
  else
    render :new
  end
end

def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to admin_products_path, notice: "Update Success"
  else
    render :edit
end
end

def destroy
  @product =  Product.find(params[:id])

  @product.destroy
  redirect_to admin_products_path,  alert: "Product Deleted"
end

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
  params.require(:product).permit(:title, :description, :price, :quantity, :image)
end



end
