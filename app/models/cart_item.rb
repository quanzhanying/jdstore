class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  
  def increase_product_quantity
    product = self.product.quantity
    if self.quantity < product
      self.quantity += 1
      self.save
    end
  end

  def decrease_product_quantity
      self.quantity > 0
      self.quantity -= 1
      self.save
  end
end
