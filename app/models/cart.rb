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
  # def add_product_to_cart(product)
  #   ci = cart_items.build
  #
  #   ci.product = product
  #   ci.quantity = 1
  #   ci.save
  # end
    def initialize
      @items = []
    end

    def add_product(product)
     current_item = @items.find{|item| item.product == product}
     if current_item
       current_item.increment_quantity
     else
       @items << CartItem.initialize(product)
     end
   end
  # def destroy_product_to_cart(product)
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
