class Category < ApplicationRecord
   has_many :products
   has_many :menus
   validates :name, presence: true #name字段不能为空
end
