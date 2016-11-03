class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  def show
    @cart_item = CartItem.find(parmas[:id])
  end
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def increment_quantity
      @cart_item = CartItem.find(params[:id])
      @cart_item.increment_quantity!
      redirect_to :back

  end

  def decrement_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.decrement_quantity!
    redirect_to :back
  end

  private

  def cart_item_params
     params.require(:cart_item).permit(:cart_id,:product_id,:quantity)
  end
end
