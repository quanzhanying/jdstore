class CartItemsController < ApplicationController
  before_action :authenticate_user!
  # respond_to :js, only: [:decrease, :increase]

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.product.stock >=cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = "成功变更数量"
    else
      flash[:warning] = "数量不足以加入购物车"
    end
    redirect_to carts_path
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:alert] = "成功将 #{@product.name} 从购物车删除！"
    redirect_to :back
  end

  # 增加数量
  def increase
    # 加入购物车的数量不能超过库存数量
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.quantity < @cart_item.product.stock
      @cart_item.quantity = @cart_item.quantity + 1
      @cart_item.save
    elsif @cart_item.quantity == @cart_item.product.stock
      # alert: "库存不足！"
    end
    # redirect_to :back
    render "increase"
  end

  # 减少数量
  def decrease
    #商品数量最少为1件
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
   if @cart_item.quantity > 0
        @cart_item.quantity -= 1
        @cart_item.save
   elsif @cart_item.quantity == 0
    #  alert: "商品不能少于零！"
   end
   redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
