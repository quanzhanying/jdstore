# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :integer
#  stock       :integer
#  can_sell    :boolean
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  category_id :integer
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category

  scope :selling, -> { where(can_sell: true) } #选出正在销售中的商品

end
