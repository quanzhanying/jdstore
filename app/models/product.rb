class Product < ApplicationRecord
  mount_uploader :image,ImageUploader

  def updated_at_formate
    self.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
