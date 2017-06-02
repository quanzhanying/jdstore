class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list
  has_many :favorites
  has_many :users, through: :favorites, source: :user
  validates :title, :description ,:quantity ,:price , presence: true #只是让栏位不能为空了，但是不完善数量和价格没限制为整数为正

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
