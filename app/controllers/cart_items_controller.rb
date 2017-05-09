class CartItemsController < ApplicationController
     def update
        @cart = current_cart
        @cart_item = @cart.cart_items.find_by(product_id: params[:id])
        if @cart_item.product.quantity >= cart_item_params[:quantity].to_i

             @cart_item.update(cart_item_params)
             flash[:notice] = "成功变更数量"
        else
             flash[:warning] = "数量不足以加入购物车"
        end

        redirect_to carts_path
     end

     private

     def cart_item_params
        params.require(:cart_item).permit(:quantity)
     end

end
