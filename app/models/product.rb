class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :photos
  accepts_nested_attributes_for :photos

  has_many :favorites
  has_many :fans, through: :favorites, source: :user

  def iwasher?
    self.model == 'SC73E610TI'
  end

  def ilife?
    self.model == 'ILIFEV3'
  end

  def mi?
    self.model == 'MICON2'
  end
end
