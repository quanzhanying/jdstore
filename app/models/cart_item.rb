class CartItem < ApplicationRecord

  belong_to :cart
  belong_to :product
  
end
