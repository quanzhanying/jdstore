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

 def prodcut_type
   type = "toy"
   if self.category == "喂养"
     type = "eat"
   else self.category == "儿童服饰" || self.category == "婴幼儿服饰"
     type = "cloth"
   end
 end

end
