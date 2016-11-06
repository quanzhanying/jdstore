class Order < ApplicationRecord

  belongs_to :user
  has_many :product_lists

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  before_create :generate_token

  # token变成uuid
  def generate_token
    self.token = SecureRandom.uuid
  end

    
  include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned
    # 付款
    event :make_payment do
      transitions from: :order_placed, to: :paid
    end
    # 发货
    event :ship do
      transitions from: :paid, to: :shipping
    end
    # 送货
    event :deliver do
      transitions from: :shipping, to: :shipped
    end
    # 退货
    event :return_good do
      transitions from: :shipped, to: :good_returned
    end
    # 取消订单
    event :cancell_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end

end

# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :integer          default(0)
#  user_id          :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  is_paid          :boolean          default(FALSE)
#  payment_method   :string
#  aasm_state       :string           default("order_placed")
#
# Indexes
#
#  index_orders_on_aasm_state  (aasm_state)
#  index_orders_on_token       (token)
#
