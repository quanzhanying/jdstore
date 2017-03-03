class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  def is_quwan_goods?
    quwan_goodsid.present?
  end

  def get_details_image(type)
    if self.is_quwan_goods?
        GoodsImage.where(quwan_goodsid: self.quwan_goodsid, img_type: type).order("idx ASC")
    end
  end
end
