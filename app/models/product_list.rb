class ProductList < ApplicationRecord
  belongs_to :order

  def updated_at_formate
    self.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
