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
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites, source: :user
  acts_as_list

  has_many :photos
  accepts_nested_attributes_for :photos

  scope :random, -> { limit(3).order("RANDOM()") }     ## limit是随机的数目

  has_many :reviews


end
