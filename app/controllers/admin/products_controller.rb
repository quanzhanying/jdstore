class Admin::ProductsController < ApplicationController

  layout "admin"

before_action :authenticate_user!
before_action :admin_required


def index
  @products = Product.all
end

def new
  @product = Product.new
end

def edit
  @product = Product.find(params[:id])
end


def create
  @product = Product.new(product_params)

  if @product.save
    redirect_to admin_products_path
  else
    render :new
  end
end

def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to admin_products_path, notice:"Update success"
  else
    render :edit
  end
end


def destroy
  @product = Product.find([:id])
  @product.destroy
  redirect_to admin_products_path, notice:"Product deleted"
end


def admin_required
  if !current_user.admin?
    redirect_to '/'
  end
end




private

def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end






end
