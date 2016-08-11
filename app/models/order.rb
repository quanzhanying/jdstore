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
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  payment_method   :string
#  is_paid          :boolean          default(FALSE)
#  aasm_state       :string           default("order_placed")
#

class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  belongs_to :user
  # belongs_to :cart !!!这里不能有belongsto
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  has_many :product_lists


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
