# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  total            :integer          default(0)
#  user_id          :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  token            :string
#

class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  has_many :product_lists
  belongs_to :user
end
