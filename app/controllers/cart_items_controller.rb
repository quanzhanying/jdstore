class CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all
  end
  def show
    @cart_item =
  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  private

  def cart_item_params
     params.require(:cart_item).permit(:cart_id,:product_id,:quantity)
  end
end

end
