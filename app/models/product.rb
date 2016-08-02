# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  quantity     :integer
#  price        :decimal(, )
#  image        :string
#  is_published :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :published, -> {where(is_published: true)}
end
