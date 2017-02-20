class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product


    def add_product_to_cart(product)
      ci = cart_items.build
      ci.product = product
      ci.quantity = 1
      ci.save
    end
    # 为什么这一段是放在cart.rb  而不是放在cart_item.rb?
    # 因为是当前的current_cart 添加。
end
