class Product < ActiveRecord::Base
  scope :published, -> { where(is_hidden: false) }
  mount_uploader :image, ImageUploader
  has_many :favorites
  has_many :fans, through: :favorites, source: :user
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
