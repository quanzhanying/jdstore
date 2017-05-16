class Order < ApplicationRecord
belongs_to :users
validates :billing_name, persence:true
validates :billing_address, prsence:true
validates :shipping_name, presence:true
validates :shipping_address, presence:true
end
