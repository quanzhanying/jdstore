class CartsController < ApplicationController
  before_action :authenticate_user! , only: [:checkout]

  def index
    @suggests_show = Product.selling.random4 #选出4个随机商品
  end
  
  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :can_sell)
  end
end
