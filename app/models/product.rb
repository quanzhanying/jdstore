# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  money       :float
#  storage     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_hidden   :boolean          default(TRUE)
#  image       :string
#

class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :money, presence: true
  validates :storage, presence:true

  mount_uploader :image, ImageUploader
end
