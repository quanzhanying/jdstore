class CartItemsController < ApplicationController
    before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "成功将 #{@product.title} 从购物车删除!"
    redirect_to :back
  end

    def update
      @cart = current_cart
      @cart_item = @cart.cart_items.find_by(product_id: params[:id])
         if @cart_item.product.quantity >= cart_item_params[:quantity].to_i # 如果这个项目对应的产品的库存数量 大于等于 表单更新的数量,那么就允许更改数量. 这个表单传递的数量应该是字符要转化为数字.
      @cart_item.update(cart_item_params)
     flash[:notice] = "成功变更数量"
   else
     flash[:warning] = "数量不足以加入购物车, 库存只有#{@cart_item.product.quantity}个"
   end

      redirect_to carts_path
    end

    private

    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end

end
