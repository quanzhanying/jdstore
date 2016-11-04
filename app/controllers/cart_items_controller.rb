class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def show
    @cart_item = CartItem.find(parmas[:id])
  end

  def destroy
    @cart = current_cart
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def increment_quantity
    @cart_item = CartItem.find(params[:id])
    @product = @cart_item.product
    if @product.quantity > 0
      if @cart_item.quantity < @product.quantity
        @cart_item.quantity += 1
        @cart_item.save
        flash[:notice] = '成功添加！'
      else
        flash[:warning] = '超出库存！'
       end
    else
      falsh[:warning] = '库存为零'
   end
    redirect_to carts_path
  end

  def decrement_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
      @cart_item.save
      redirect_to carts_path
    else
      flash[:alert] = '恭喜抢到一件'
      redirect_to carts_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
  end
end
