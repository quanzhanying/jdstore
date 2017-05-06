class Admin::ProductsController < ApplicationController
before_action :authenticate_user!
before_action :require_is_admin

def index
  @products = Product.all
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
    redirect_to admin_products_path, notice: "Update Success"
  else
    render :edit
  end
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to admin_products_path, alert: "Product Deleted"
end

def require_is_admin
  if !current_user.admin?
    flash[:alert] = "You are not admin"
    redirect_to root_path
  end
end

private

def product_params
  params.require(:product).permit(:title, :description, :price, :quantity, :image)
end

end
