class Chef < ApplicationRecord
  validates :name, presence: true
  validates :style, presence: true
  validates :city, presence: true

  mount_uploader :image, ImageUploader

  has_many :chef_times
  has_many :carts

  has_many :favor_chefs_relationships
  has_many :followers, through: :favor_chefs_relationships, source: :user

  has_many :photos
  accepts_nested_attributes_for :photos

  has_many :chef_comments
  has_many :comments_from_user, through: :chef_comments, source: :user

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at') }
end
