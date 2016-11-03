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
  def pay_with_alipay!
    self.is_paid = true
    self.payment_method = "alipay"
    self.save
  end

  def pay_with_wechat!
    self.is_paid = true
    self.payment_method = "wechat"
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
      transitions from: :paid,         to: :shipping
    end

    event :deliver do
      transitions from: :shipping,      to: :shipped
    end

    event :return_good do
      transitions from: :shipped,       to: :good_returned
    end

    event :cancell_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end

  end


end
