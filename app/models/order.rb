class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
     self.update_columns(payment_method: method)
     end

  def pay!
     update_columns(is_paid: true)
  end

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  belongs_to :user
  has_many :product_lists

  include AASM

aasm do
 state :order_placed, initial: true
 state :paid
 state :cancelling
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
   transitions from: [:order_placed,:paid, :cancelling], to: :order_cancelled
 end


end

       def status
         s = "未支付"
         if is_paid == true
           s = "已支付"
         end
         s
       end


end
