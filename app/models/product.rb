class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category

  before_create :set_default_attrs #產品創建之前生成唯一uuid

  private

    def set_default_attrs
      self.uuid = RandomCode.generate_product_uuid
    end
    
end
