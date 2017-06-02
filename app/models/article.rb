class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  belongs_to :user
  has_many :article_reviews, dependent: :destroy


  # ---后台隐藏或公开按钮---

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
