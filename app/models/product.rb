class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0}
  mount_uploader :image, ImageUploader
  scope :published, -> { where(:is_hidden => false)}
  scope :recent, -> { order("created_at DESC")}
  has_many :photos
  accepts_nested_attributes_for :photos
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
