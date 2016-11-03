class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }
  mount_uploader :image, ImageUploader
  def onsale!
    self.onsale = true
    self.save
  end

  def soldout!
    self.onsale = false
    self.save
  end
  
end
