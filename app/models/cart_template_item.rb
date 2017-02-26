class CartTemplateItem < ApplicationRecord
  belongs_to :cart
  belongs_to :template
end
