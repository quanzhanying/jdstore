class CartsController < ApplicationController
  def destroy
    @products = current_cart.products
    @products.delete_all
    redirect_to :back
    flash[:alert] = "已清空购物车"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :can_sell)
  end
end
