class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, numericality: { greater_than: 0}
  validates :price, numericality: { greater_than: 0}

  scope :recent, -> {order("created_at DESC")}
end
