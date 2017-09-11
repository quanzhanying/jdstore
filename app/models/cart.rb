class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product
  has_many :courses, through: :cart_items, source: :course

  # --商品加入购物车--
  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

  # --课程加入购物车--
  def add_course_to_cart(course)
    ci = cart_items.build
    ci.course = course
    ci.save
  end


  # --商品计算总价--
  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end

  # --课程计算总价
  def total_course_price
    sum = 0
    cart_items.each do |cart_item|

      if cart_item.course.price.present?
        sum +=  cart_item.course.price
      end
    end
    sum
  end

  # --移除购物车某件商品--
  def clean!
    cart_items.destroy_all
  end

  # --移除购物车所有商品--


end
