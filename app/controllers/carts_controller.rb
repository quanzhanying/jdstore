class CartsController < ApplicationController
  def clean
    current_cart.clean!

    redirect_to :back
    flash[:notice]="您的购物车已清空"
  end
end
