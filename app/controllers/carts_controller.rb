class CartsController < ApplicationController
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path, alert:"Cart deleted"
  end
  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end
  def cart_params
   params.require(:cart).permit(:price, :quantity)
  end
  def checkout
    @order = Order.new
  end
end
