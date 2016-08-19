class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :product_lists
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  scope :recent, -> { order("created_at DESC")}

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
      transitions from: :shipping,     to: :shipped
    end

    event :return_good do
      transitions from: :shipped,      to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid],  to: :order_cancelled
    end
  end


  def pay!(payment_method)
    # if !self.is_paid
    #   self.update_columns({:is_paid => true, :payment_method => payment_method})
    #   OrderMailer.notify_order_placed(self).deliver!
    # end
    if !self.paid?
      self.update_columns({:is_paid => true, :payment_method => payment_method})
      self.make_payment!
      OrderMailer.notify_order_placed(self).deliver!
    end
  end

  def apply_cancle_order!
    if !self.appling_cancel_order?
      self.apply_cancel_order!
      OrderMailer.notify_order_state_change(self, "user").deliver!
    end
  end

  def apply_return_good!
    if !self.appling_good_return?
      self.apply_good_return!
      OrderMailer.notify_order_state_change(self, "user").deliver!
    end
  end

  def cancle_order!
    if self.appling_cancel_order? || self.order_placed? || self.paid?
      self.cancel_order!
      OrderMailer.notify_order_state_change(self, "admin").deliver!
    end
  end

  def ship_order!
    if self.paid?
      self.ship!
      OrderMailer.notify_order_state_change(self, "admin").deliver!
    end
  end

  def confirm_receipt!
    if self.shipping?
      self.deliver!
      OrderMailer.notify_order_state_change(self, "user").deliver!
    end
  end



end
