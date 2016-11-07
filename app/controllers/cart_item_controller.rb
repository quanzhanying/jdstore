class CartItemController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])

    @cart_item.destroy

    redirect_to root_path
  end


    def plus_quantity
      @cart_item = CartItem.find(params[:id])
      @item = @cart_item.item

      if @cart_item.storage >= @item.storage
        flash[:warning] = "The last one is just sold."
      else
        @cart_item.storage += 1
        @cart_item.save
      end

        redirect_to :back
    end

    def minus_quantity
      @cart_item = CartItem.find(params[:id])
      @item = @cart_item.item

      if @cart_item.storage > 1
        @cart_item.storage -= 1
        @cart_item.save
      else
        flash[:warning] = "Opt delete, if you don't want this product anymore."
      end

      redirect_to :back
    end



end
