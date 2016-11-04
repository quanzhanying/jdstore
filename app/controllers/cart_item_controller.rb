class CartItemController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])

    @cart_item.destroy

    redirect_to root_path
  end


    def plus_quantity
      @cart_item = CartItem.find(params[:id])
      @cart_item.storage += 1
      @cart_item.save

      redirect_to :back
    end

    def minus_quantity
      @cart_item = CartItem.find(params[:id])
      @cart_item.storage -= 1
      @cart_item.save

      redirect_to :back
    end



end
