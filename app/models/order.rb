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
#

class Order < ApplicationRecord
  before_create :generate_token

  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end

  scope :current_order, -> (user){where(:user_id => user)}
  scope :recent, -> {order("created_at DESC")}

  def pay_with_alipay!
    self.is_paid = true
    self.payment_method = "alipay"
    self.make_payment!
    self.save
  end

  def pay_with_wechat!
    self.is_paid = true
    self.payment_method = "wechat"
    self.make_payment!
    self.save
  end

  def pay_with_apple!
    self.is_paid = true
    self.payment_method = "apple"
    self.make_payment!
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

      event :cancel_order do
        transitions from: [:order_placed, :paid], to: :order_cancelled
      end
    end

end
