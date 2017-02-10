class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :price, numericality: { greater_than: 0}
  #validates :quantity, numericality: { greater_than: 0}
  mount_uploader :image, ImageUploader

  def quantity_reduce(num)
    self.quantity -= num
    self.save
  end
end
