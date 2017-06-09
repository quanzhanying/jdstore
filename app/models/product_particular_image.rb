# == Schema Information
#
# Table name: product_particular_images
#
#  id         :integer          not null, primary key
#  product_id :integer
#  image      :string
#  main_image :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductParticularImage < ApplicationRecord

  belongs_to :product

  # 商品详情图片上传 #
  mount_uploader :image, ImageUploader

end
