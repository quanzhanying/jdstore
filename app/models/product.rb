class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  mount_uploader :image, ImageUploader
  def onsale!
    self.onsale = true
    self.save
  end

  def soldout!
    self.onsale = false
    self.save
  end
  has_many :order_relationships
  has_many :participated_orders, :through => :order_relationships, :source => :order
end
