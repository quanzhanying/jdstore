class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :photos
  accepts_nested_attributes_for :photos

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
