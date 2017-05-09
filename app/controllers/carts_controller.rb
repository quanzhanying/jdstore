class CartsController < ApplicationController
    before_action :authenticate_user!

    def destroy
      @cart = current_cart
      @cart_item = @cart.cart_items.find_by(product_id: params[:id])
      @product = @cart_item.product
      @cart_item.destroy

      flash[:warning] = "成功将 #{@product.title} 从购物车删除!"
      redirect_to :back
    end
    def clean
       current_cart.clean!
       flash[:warning] = "已清空购物车"
       redirect_to carts_path
    end

end
