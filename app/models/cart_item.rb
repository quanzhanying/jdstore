class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def add_product_quantity(current_cart)
    @cart_item = CartItem.find_by(cart_id: current_cart.id)
    @cart_item.quantity = @cart_item.quantity + 1
    @cart_item.save
  end
end
