class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # def add_item(product_id)
  #     item = items.find_or_create_by_product_id(product_id)
  #     item.quantity += 1
  #     item.save
  #   end

  

end
