class CartItemsController < ApplicationController
     def update
        @cart = current_cart
        @cart_item = @cart.cart_items.find_by(product_id: params[:id])
        @cart_item.update(cart_item_params)

        redirect_to carts_path
     end

     private

     def cart_item_params
        params.require(:cart_item).permit(:quantity)
     end

end
