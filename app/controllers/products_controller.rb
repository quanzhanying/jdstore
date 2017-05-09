class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
    @product = Product.find(params[:id])
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

  def add_to_cart
     @product = Product.find(params[:id])
     current_cart.add_product_to_cart(@product)
     flash[:notice] = "成功加入购物车"
     redirect_to :back
   end

 helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :is_hidden)
  end

 def find_cart
   cart = Cart.find_by(id: session[:cart_id])
   if cart.blank?
     cart = Cart.create
   end
   session[:cart_id] = cart.id
   return cart
 end

end
