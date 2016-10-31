class CartsController < ApplicationController

  # def new
  #   @cart = Cart.new
  # end
  #
  # def create
  #   @cart = Cart.new(cart_params)
  #
  #   if @cart.save
  #     redirect_to cart_path
  #   else
  #     render :new
  #   end
  # end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to products_path
    flash[:notice] = '💥  购物车已清空'
  end


  # def show
  #   @cart_items = current_cart.cart_items
  # end




  private

  def cart_params
    params.require(:cart).permit(:cart_item)
  end

end
