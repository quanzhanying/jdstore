class ItemsController < ApplicationController


  def index
    @items = Item.all
  end


  def show
    @item = Item.find(params[:id])
  end


  def add_to_cart
    @item = Item.find(params[:id])
    current_cart.add_item_to_cart(@item)
    redirect_to :back
  end

private
  def job_params
    params.require(:item).permit(:title, :description, :price, :storage, :is_available, :attachment)
  end

end
