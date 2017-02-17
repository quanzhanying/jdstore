class Order < ApplicationRecord
    alias_attribute :shipping_address, :address
    belongs_to :user
    validates :billing_name, presence: true
    validates :billing_address, presence: true
    validates :shipping_name, presence: true
    validates :shipping_address, presence: true

    has_many :product_lists
end
