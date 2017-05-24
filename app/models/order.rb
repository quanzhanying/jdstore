class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user
  has_many :product_lists

  validates :shipping_name, presence: true
  validates :shipping_number, presence: true
  validates :shipping_address, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.payment_method = method
    self.save
  end

  def pay!
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

    event :make_payment, after_commit: :pay! do
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

    event :cancel_order  do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end

  def paid
    self.aasm_state != "order_placed"
  end

  def can_be_cancelled?
    self.aasm_state == "order_placed" || self.aasm_state == "paid"
  end

  def can_be_returned?
    self.aasm_state == "shipped"
  end

  def can_be_shipped?
    self.aasm_state == "paid"
  end

end
