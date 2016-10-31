# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  image_id    :integer
#  picture     :json
#

class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, numericality: { greater_than: 0}
  validates :price, numericality: { greater_than: 0}

  mount_uploader :image, ImageUploader

  scope :recent, -> { order("created_at DESC")}
end
