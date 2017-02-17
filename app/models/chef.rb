class Chef < ApplicationRecord
  has_many :chef_times
  has_many :carts
end
