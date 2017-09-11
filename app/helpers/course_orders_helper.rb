module CourseOrdersHelper
  def render_course_order_paid_state(course_order)
    if course_order.is_paid?
      "已付款"
    else
      "未付款"
    end
  end
end
