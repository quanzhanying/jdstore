class Product < ApplicationRecord
  validates :title, presence: true
  validates :style, presence: true
  mount_uploader :image, ImageUploader

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :published, -> { where(is_hidden: false) }
end
