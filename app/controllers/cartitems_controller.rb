class CartitemsController < ApplicationController
  def index
    @cartitem = Cartitem.all
  end

  def destroy
    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
  end

  private

  def cartitem_params
     params.require(:cartitem).permit(:cart_id,:product_id,:quantity)
  end
end
