class Product < ApplicationRecord
  validates :title, presence:true
  validates :description, presence:true
  validates :price, presence:true
  validates :quantity, presence:true
  validates :category, presence:true
  mount_uploader :image, ImageUploader
  # belongs_to :product_category

  def index_of_category
    ret_index = 0
    ProductCategory.all.each_with_index do |cate, index|
      if cate.name == self.category
        ret_index = index
        break
      end
    end
  end
end
