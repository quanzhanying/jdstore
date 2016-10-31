class ProductsController < ApplicationController
before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
    @product = Product.find(params[:id])
  end

def index
  @products = Product.all
end

def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end


def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end

end
