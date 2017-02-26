class Product < ApplicationRecord
  validates :title, presence: true
  mount_uploader :image, ImageUploader

  has_many :favor_product_relationships
  has_many :followers, through: :favor_product_relationships, source: :user

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
