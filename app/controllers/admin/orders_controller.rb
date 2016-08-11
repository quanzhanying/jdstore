class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"

  def index
    @orders = Order.all
  end


  def show
    @order = Order.find_by_token(params[:id])
    @order_lists= @order.product_lists
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancell_order!
    redirect_to :back
  end

  def edit
    @Order = Order.find(params[:id])
  end



  private
  def Order_params
    params.require(:Order).permit(:title, :description, :quantity, :price, :image)
  end


end
