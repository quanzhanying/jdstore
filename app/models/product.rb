class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list
  has_many :favorites
  has_many :users, through: :favorites, source: :user


  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

end
