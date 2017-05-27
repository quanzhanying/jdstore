class CoursesController < ApplicationController


  # ---CRUD---
  def index
    @courses = Course.all.order("position ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @course = Course.find(params[:id])
  end

  def add_to_cart
    @course = Course.find(params[:id])
    if !current_cart.courses.include?(@course)
      current_cart.add_course_to_cart(@course)
      flash[:notice] = "你已成功将 ''#{@course.title}'' 加入购物车"
    else
      flash[:warning] = "你的购物车已有此商品"
    end
    redirect_to :back
  end

  def instant_buy
    @course = Course.find(params[:id])
    if !current_cart.courses.include?(@course)
      current_cart.add_course_to_cart(@course)
      flash[:notice] = "你已成功将 ''#{@course.title}'' 加入购物车"
    else
      flash[:warning] = "你的购物车已有此商品"
    end
    redirect_to cart_path(@course)
  end

end
