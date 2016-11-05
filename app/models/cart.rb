# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product
  # belongs_to :orders
  def add_product_to_cart(product)

    # current_item = @items.find {|item| item.product == product}
    #判断是否存在，存在当前的item，则购物车数量增加1，否则把CartItem放进items里头
    if cart_item = self.cart_items.find_by_product_id(product.id)
       cart_item.quantity = cart_item.quantity+1
       cart_item.save

    else
       ci = cart_items.build
       ci.product = product
       ci.quantity = 1
       ci.save
    end
  end
  #   def initialize
  #     @items = []
  #   end
  #
  #   def add_product_to_cart(product)
   #
  #    if current_item
  #       current_item.increment_quantity
  #   #  else
  #   #    @items << CartItem.initialize(product)
  #    end
  #  end

  #  def move_product_to_cart(product)
  #    if current_item
  #      current_item.decrement_quantity
  #    end
  #  end
  # # # def destroy_product_to_cart(product)
  #   ci = cart_items.destroy
  #   ci.product = @product.destroy
  #   ci.quantity = 0
  #   ci.save
  # end
  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end
    sum
  end
end
