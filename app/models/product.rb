class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.search(searcher)
    where("title LIKE ?", "%#{searcher}%").or(where("description LIKE ?", "%#{searcher}%"))
  end

  has_many :reviews
  has_many :photos
  accepts_nested_attributes_for :photos

end
