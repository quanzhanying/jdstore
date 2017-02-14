class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id:params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "Product #{@product.title} was removed from your cart!"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])

    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
        @cart_item.update(cart_item_params)
        flash[:notice] = "Changed quantity successfully!"
    else
        flash[:warning] = "Not enough quantity!"
    end

    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end


end
