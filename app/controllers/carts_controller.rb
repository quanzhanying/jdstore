class CartsController < ApplicationController

def clean
  current_cart.clean!
  flash[:warning]="已清空购物车"
  redirect_to carts_path
end

  def destroy
    @cart=Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
    flash[:alert]="该物品已删除"
  end
end
