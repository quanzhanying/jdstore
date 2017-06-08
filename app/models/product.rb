class Product < ApplicationRecord

  belongs_to :category

  # before_create :set_default_attrs

  has_many :favorites
  has_many :favorited_users, :through => :favorites, :source => :user

  mount_uploader :image, ImageUploader
  acts_as_list

  private

  # def set_default_attrs
  #   self.number = self.id
  # end

end
