class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true #name字段不能为空
end
