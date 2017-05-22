class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shopping_name, presence: true
  validates :shopping_address, presence: true

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
    state :shopping
    state :shopped
    state :order_cancelled
    state :good_rerurned

    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :shop do
      transitions from: :paid,          to: :shopping
    end

    event :deliver do
      transitions from: :shopping,      to: :shopped
    end

    event :return_good do
      transitions from: :shopped,       to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end
end
