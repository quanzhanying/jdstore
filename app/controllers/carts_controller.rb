class CartsController < ApplicationController

  def up_product
      @cart_item = CartItem.find(params[:id])
      @product = @cart_item.product
      if (@cart_item.quantity + 1) > @product.quantity
        flash[:alert] = "抱歉，库存不够了"
      else
        @cart_item.quantity = @cart_item.quantity + 1
        @cart_item.save
      end
      redirect_to :back
  end

  def down_product
      @cart_item = CartItem.find(params[:id])
      if (@cart_item.quantity - 1) < 1
        flash[:alert] = "最少要一个产品哦"
      else
        @cart_item.quantity = @cart_item.quantity - 1
        @cart_item.save
      end
      redirect_to :back
  end


  def destroy
      @cart = Cart.find(params[:id])
      @cart.cart_items.destroy_all
      redirect_to :back
  end

end
