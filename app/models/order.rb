# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total_price      :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  token            :string
#

class Order < ApplicationRecord
  before_create :generate_token

  belongs_to :user

  has_many :product_lists

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end

  def pay!(payment_method)
    if !self.is_paid
      self.update_columns({:is_paid => true, :payment_method => payment_method})
      OrderMailer.notify_order_placed(self).deliver!
    end
  end

end
