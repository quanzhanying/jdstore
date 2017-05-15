class CartsController < ApplicationController
  # 清空购物车方法与教材中不一致
  def destroy
    @products = current_cart.products
    @products.delete_all
    redirect_to :back
    flash[:alert] = "已清空购物车"
  end
  # 清空购物车代码结束

  def checkout
    @order = Order.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :can_sell)
  end
end
