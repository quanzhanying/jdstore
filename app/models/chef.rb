class Chef < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :chef_times
  has_many :carts

  has_many :favor_chefs_relationships
  has_many :followers, through: :favor_chefs_relationships, source: :user

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
