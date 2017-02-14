class Order < ApplicationRecord
  include AASM


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

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment, after_commit: :pay! do
      translations from: :order_placed, to: :paid
    end

    event :ship do
      translations from: :paid, to: :shipping
    end

    event :deliver do
      translations from: :shipping, to: :shipped
    end

    event :return_good do
      translations from: :shipped, to: :good_returned
    end

    event :cancell_order do
      translations from: :[:order_placed, :paid], to: :order_cancelled
    end
  end
end
