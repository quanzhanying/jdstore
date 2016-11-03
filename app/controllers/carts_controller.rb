class CartsController < ApplicationController
  def checkout
      @order = Order.new
    end



  def destroy
      @cart = current_cart
      @cart.destroy
      session[:cart_id] = nil
      redirect_to :back, notice: "物价已经空了，不要买买买了"
     end

  # def index
  #    @cart = current_cart
  #    @cart_items = @cart.cart_items.all
  # end


end
