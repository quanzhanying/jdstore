class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart = current_cart
    @cart_items = @cart.cart_items.all
  end


  # def destroy_to_cart
    #@product = Product.find(params[:id])
    # binding.pry
    #current_cart.destroy_product_to_cart(@product)
    # redirect_to :back
  # end
  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to carts_path
    else
      render :new
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def show
    @cart = Cart.find(params[:id])
    @product_lists = @order.product_lists
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path
    else
      render :edit
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end

  private

  def cart_params
    params.require(:cart).permit(:created_at, :updated_at)
  end
end
