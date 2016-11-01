class Order < ApplicationRecord
  belongs_to  :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
end

# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :integer          default(0)
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
