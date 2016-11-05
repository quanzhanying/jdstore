class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
  belongs_to :user
  has_many :product_lists
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  # scope :only, ->(user){where.(id: user)}

  include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned
    state :sent_cancell_require


  event :make_payment do
    transitions form: :order_placed, to: :paid
  end

  event :ship do
    transitions from: :paid, to: :shipping
  end

  event :cancell_require do
    transitions form: :paid, to: :sent_cancell_require
  end

  event :deliver do
    transitions from: :shipping, to: :shipped
  end

  event :return_good do
    transitions from: :shipped, to: :good_returned
  end

  event :cancell_order do
    transitions from: [:order_placed, :paid, :sent_cancell_require], to: :order_cancelled
  end

end
end
