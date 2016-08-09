# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total_price      :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  token            :string
#

class Order < ApplicationRecord
  include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned
    state :appling_cancel_order
    state :appling_good_return

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
      transitions from: [:shipped, :appling_good_return], to: :good_returned
    end

    event :cancell_order do
      transitions from: [:order_placed, :paid, :appling_cancel_order], to: :order_cancelled
    end

    event :apply_cancel_order do
      transitions from: [:order_placed, :paid], to: :appling_cancel_order
    end

    event :apply_good_return do
      transitions from: :shipped, to: :appling_good_return
    end

  end

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
      OrderMailer.notify_order_state_change(self).deliver!
    end
  end

  def apply_return_good!
    if !self.appling_good_return?
      self.apply_good_return!
      OrderMailer.notify_order_state_change(self).deliver!
    end
  end

end
