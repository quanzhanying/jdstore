class Admin::OrdersController < ApplicationController

  layout "admin"

  def index
    @orders = Order.all
    # @user_email = user_email.find_by("id")
  end

  # def

    # button_to("Ship the product", @order.ship! )

  # def show
  #   @order = Order.all
  #   # @item_lists = @order.item_lists
  # end
  def paid_to_ship
    @order = Order.find_by_token(params[:id])
    @order.ship!
    redirect_to :back
  end

  def ship_to_deliver
    @order = Order.find_by_token(params[:id])
    @order.deliver!
    redirect_to :back

  end





end
