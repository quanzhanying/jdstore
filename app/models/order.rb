class Order < ApplicationRecord
  before_create :generate_token

  belongs_to  :user
  has_many :product_lists

  scope :current_order, -> (user){where(user_id: user)}

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end

  def wechat_pay!
    self.payment_method = "微信"
    self.is_paid = true
    self.save
  end

  def alipay_pay!
    self.payment_method = "支付宝"
    self.is_paid = true
    self.save
  end

include AASM
  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment do
      transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :deliver do
      transitions from: :shipping, to: :shipped
    end

    event :return_good do
      transitions from: :shipped, to: :good_returned
    end

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
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  token            :string
#  is_paid          :boolean          default(FALSE)
#  payment_method   :string
#  aasm_state       :string           default("order_placed")
#
# Indexes
#
#  index_orders_on_aasm_state  (aasm_state)
#
