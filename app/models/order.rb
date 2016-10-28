class Order < ApplicationRecord
  belongs_to :user
  has_many :order_relationships
  has_many :members, :through => :order_relationships, :sources => :product

end
