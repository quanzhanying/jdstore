class CartsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.destroy
      flash[:notice] = "Delete product success！"
    else
      flash[:warning] = "Delete product failed！"
    end
    redirect_to :back
  end

end
