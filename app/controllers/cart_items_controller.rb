class CartItemsController < ApplicationController

  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning]= "成功将#{@product.title}从购物车删除！"
    redirect_to :back
  end

  # def up
  #   @cart = current_cart
  #   @cart_item = @cart.cart_items.find_by(product_id: params[:id])
  #   @product = @cart_item.product
  #   if @product.quantity > 0
  #     @cart_item.quantity = @cart_item.quantity +1
  #     @product.quantity = @product.quantity -1
  #   else
  #     flash[:warning] = "该商品已缺货，正在补货"
  #   end
  #   redirect_to :back
  # end
  #
  # def down
  #   @cart = current_cart
  #   @cart_item = @cart.cart_items.find_by(product_id: params[:id])
  #   @product = @cart_item.product
  #   @cart_item.quantity = @cart_item.quantity - 1
  #   @product.quantity = @product.quantity + 1
  #   redirect_to :back
  # end

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
