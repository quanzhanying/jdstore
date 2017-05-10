class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @cart_item.update(cart_item_params)

    redirect_to carts_path
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    redirect_to carts_path
    flash[:warning] = "Deleted #{@product.title} successfully!"
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
