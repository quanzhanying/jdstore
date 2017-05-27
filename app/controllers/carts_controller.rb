class CartsController < ApplicationController

  def destroy_all
  end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end

  def show
    @course_order = CourseOrder.new
  end

end
