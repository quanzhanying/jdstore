# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  product_id :integer
#  avatar     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Picture < ApplicationRecord
  # 商品详情上传多张图片与product的关系
    mount_uploader :avatar, AvatarUploader
    belongs_to :product
  # 商品详情上传多张图片与product的关系结束
end
