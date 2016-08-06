class Product < ApplicationRecord
  validates :title, :description, :price, :store, presence: true
  validates :store, :price, numericality: { greater_than: 0}
end
