class Order < ApplicationRecord

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  has_many :product_lists

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment, after_commit: :pay! do
      transitions form: :order_placed, to: :paid
    end

    event :ship do
      transitions form: :paid, to: :shipping
    end

    event :deliver do
      transitions form: :shipping, to: :shipped
    end

    event :return_good do
      transitions form: :shipped, to: :goog_returned
    end

    event :cancel_order do
      transitions form: [:order_placed, :paid], to: :order_canceled
    end
  end

end
