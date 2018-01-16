class Product < ApplicationRecord
  validates :price, presence: true
  mount_uploader :image, ImageUploader
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC')}
  acts_as_votable

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
