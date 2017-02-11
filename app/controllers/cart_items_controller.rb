class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "成功将#{@product.title}从购物车中拿出！"
    redirect_to carts_path
  end

  # def edit
  #
  #   @cart_item = current_cart.cart_items.find_by(product_id: product_id)
  # end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])

    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      # 不明白的用法
      @cart_item.update(cart_item_params)
      flash[:notice] = "成功改变数量"
    else
      flash[:notice] = "数量不足以加入购物车"
    end
    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
