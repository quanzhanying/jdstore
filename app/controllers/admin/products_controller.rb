class Admin::ProductsController < ApplicationController

 layout "admin"
 before_action :authenticate_user!
 before_action :admin_required
 before_action :find_product, only: [:show, :edit, :update, :destroy]

def index
  @products = Product.all
end


def new
  @product = Product.new
  @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码

end


def create
  @product = Product.new(product_params)
  @product.category_id = params[:category_id]
  if @product.save
    redirect_to admin_products_path
  else
    render :new
  end
end

def edit
  @product = Product.find(params[:id])
  @categories = Category.all.map{ |c| [c.name, c.id]}
end

def destroy

    @product.destroy
    redirect_to admin_products_path
  end

def update
  @product = Product.find(params[:id])
  @product.category_id = params[:category_id]
  if @product.update(product_params)
    redirect_to admin_products_path
  else
    rendr :edit
  end
end

private

def find_product
     @product = Product.find(params[:id])
  end

def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id)
end
end
