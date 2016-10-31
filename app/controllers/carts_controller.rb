class CartsController < ApplicationController

  def index
    @cart = current_cart
    @cart_item = CartItem.where( :cart_id => @cart.id)
  end

  def destroy
    #@cart_item = CartItem.all
    #@cart_item.destroy
    @cart = current_cart
    @cart.destroy

    @cart_items = CartItem.where( :cart_id => @cart.id)
    @cart_items.each do |d|
      d.destroy
    end

    redirect_to carts_path
  end

  # def destroy_single
  #   @cart = current_cart
  #   @c1 = CartItem.find(params[:cart_item_id])
  #   @cart_items = CartItem.where( :cart_id => @cart.id)
  #   @cart_items.each do |r|
  #     if r.id = @c1.id
  #       r.destroy
  #     end
  #   end
  #   redirect_to carts_path
  # end

  # def destroy
  #   @product = Product.find(params[:id])
  #
  #   @product.destroy
  #
  #   redirect_to admin_products_path
  # end

end
