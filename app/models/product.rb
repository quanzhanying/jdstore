class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end
end
