# -*- encoding : utf-8 -*-
class CartItem < ApplicationRecord
    belongs_to :cart
    belongs_to :product
end
