class CourseOrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @course_order = CourseOrder.find_by_token(params[:id])
    @course_lists = @course_order.course_lists
  end

  def create
    @course_order = CourseOrder.new(course_order_params)
    @course_order.user = current_user
    @course_order.total = current_cart.total_course_price

    if @course_order.save

      current_cart.cart_items.each do |cart_item|
        course_list = CourseList.new
        course_list.course_order = @course_order
        course_list.course_name = cart_item.course.title
        course_list.course_price = cart_item.course.price
        course_list.quantity = cart_item.quantity
        course_list.save
      end
      current_cart.clean!

      redirect_to course_order_path(@course_order.token)
    else
      render 'carts/checkout'
    end
  end


  # ---付款方式 支付宝、微信---

  def pay_whit_alipay
    @course_order = CourseOrder.find_by_token(params[:id])
    @course_order.set_payment_with!("alipay")

    redirect_to course_order_path(@course_order.token), notice: "使用支付宝成功完成付款"
  end

  def pay_whit_wechat
    @course_order = CourseOrder.find_by_token(params[:id])
    @course_order.set_payment_with!("wechat")

    redirect_to course_order_path(@course_order.token), notice: "使用微信成功完成付款"
  end


  # ---用户可以申请撤销订单---

  def apply_to_cancel
    @course_order = CourseOrder.find(params[:id])
    # OrderMailer.apply_cancel(@course_order).deliver!
    flash[:notice] = "已提交申请"
    redirect_to :back
  end


  # ---private---

  private

  def course_order_params
    params.require(:course_order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
