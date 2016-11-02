class CartsController < ApplicationController
before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  
  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
    redirect_to carts_path
    else
    render :new
    end
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
    @cart = Cart.find(current_cart.id)
    @cart.destroy
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end

  private

  def cart_params
    params.require(:cart).permit(:cart_item, :card_id)
  end
end
