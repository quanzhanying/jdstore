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
      if @cart_item.quantity < @product.quantity
      @cart_item.quantity += 1
      @cart_item.save
      redirect_to carts_path
    else
      falsh[:warning] = "库存为零"
      redirect_to carts_path
    end

  end



  def decrement_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
      @cart_item.save
      redirect_to carts_path
    else
      flash[:alert] = "恭喜抢到一件"
      redirect_to carts_path
    end 
  end

  private

  def cart_item_params
     params.require(:cart_item).permit(:cart_id,:product_id,:quantity)
  end
end
