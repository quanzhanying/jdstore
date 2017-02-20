class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def clean
    current_cart.clean!
    flash[:warning]="已经清空购物车。"
    redirect_to :back
  end

  def checkout
    @order=Order.new
  end

end
