# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  product_id :integer
#  avatar     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
# 多图上传与product的关系
  mount_uploader :avatar, AvatarUploader
  belongs_to :product
# 多图上传与product的关系结束
end
