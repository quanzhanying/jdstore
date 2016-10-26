class ItemsController < ApplicationController


  def index
    @items = Items.all
  end


  def show
    @item = Item.find(params[:id])
  end


private
  def job_params
    params.require(:item).permit(:title, :description, :price, :storage, :is_available, :attachment)
  end

end
