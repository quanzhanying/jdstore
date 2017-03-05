class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :categories
  def recommend!
    self.is_recommended = true
    self.save
  end

  def cancel_recommend!
    self.is_recommended = false
    self.save
  end
end
