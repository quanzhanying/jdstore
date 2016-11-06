class ItemsController < ApplicationController
before_action :check_if_exsited, only:[:add_to_cart]


def check_if_exsited
  @item = Item.find(params[:id])
  current_cart.cart_items.each do |cart_item|
    if cart_item.item == @item
      flash[:warning] = "This product is in your cart already. If you want add one more, please edit quantity in your Cart."
        redirect_to carts_path
    end
  end
end


  def index
    @items = Item.all
  end


  def show
    @item = Item.find(params[:id])
  end


  def add_to_cart
    @item = Item.find(params[:id])
    if @item.storage > 0
        current_cart.add_item_to_cart(@item)
        redirect_to :back

    else
      flash[:warning] = "This product is sold out."
      redirect_to root_path
    end
  end



private




  def job_params
    params.require(:item).permit(:title, :description, :price, :storage, :is_available, :attachment)
  end

end
