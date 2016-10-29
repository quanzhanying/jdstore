class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  
end
