class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :description, :quantity, :price, presence: true
  validates :quantity, :price, numericality: { greater_than_or_equal_to: 0}

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :recent, -> { order("created_at DESC")}
end
