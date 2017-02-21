class CartItemsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    redirect_to carts_path, alert: "成功将 #{@product.title} 移除"
  end

  def update
    p params
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      if params[:add] == "1"
        @cart_item.quantity += 1
        @cart_item.save!
      elsif params[:sub] =="1"
        @cart_item.quantity -= 1
        @cart_item.save!
      end
    elsif cart_item_params[:quantity].to_i < 0
      redirect_to carts_path
    end
    redirect_to carts_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
