class ProductsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def add_to_cart
    @product = Product.find(params[:id])
     if @product.quantity > 0
        if current_cart.products.include?(@product)
         flash[:warning] = "This product alreary in cart!"
        else
         current_cart.add_product_to_cart(@product)
        end
      end
     redirect_to :back
  end

  def remove_from_cart
    @cart_item = CartItem.find(params[:id])
    current_cart.remove_product_from_cart(@cart_item)
    @cart_item.product.quantity_increase(1)
    @cart_item.product.save
    redirect_to :back
  end

  def show
    @product = Product.find(params[:id])

    if @product.is_hidden
      flash[:warning] = "This product already archieved"
      redirect_to root_path
    end
  end

  def index
    @products = Product.where(:is_hidden => false).order("created_at DESC")
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :is_hidden)
  end
end
