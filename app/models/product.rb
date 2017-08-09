class Product < ApplicationRecord
  validates :title, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :picture, presence: true

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order("created_at DESC") }

  mount_uploader :picture, PictureUploader

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
