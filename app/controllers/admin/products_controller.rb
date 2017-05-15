class Admin::ProductsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
# before_action :require_is_admin
layout "admin"

  def index
    @products = Product.all
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

private

def product_params
  params.require(:product).permit(:title, :description, :price, :quantity)
end

# def is_admin
#   if !current_user.admin?
#     flash[:alter] = "You are not admin"
#     redirect_to root_path
#   end
# end

end
