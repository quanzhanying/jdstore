class Order < ApplicationRecord
  before_create :generate_token

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  belongs_to :user
  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end

  def is_paid!
    self.is_paid=true
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
        transitions from: :paid, to: :shipping
      end

      event :deliver do
        transitions from: :shipping, to: :shipped
      end

      event :return_good do
        transitions from: :shipped, to: :good_returned
      end

      event :cancell_order do
        transitions from: [:order_placed,:paid], to: :order_cancelled
      end

      event :confirm_cancellation do
        transitions from: :order_cancelled, to: :good_returned
      end
      # def notify_next_state
      #   @next_state= "#{aasm.to_state}"
      # end

    end

    def change_state!(order)
      case order.aasm_state
        when "order_placed"
          order.make_payment!
        when "paid"
          order.ship!
          OrderMailer.notify_order_shipping(order).deliver!
        when "shipping"
          order.deliver!
        when "shipped"
          order.return_good!
        when "order_cancelled"
          order.confirm_cancellation!
          OrderMailer.notify_order_confirm_cancellation(order).deliver!
      end
    end

      def next_state(order)
        case order.aasm_state
          when "order_placed"
            "paid"
          when "paid"
            "shipping"
          when "shipping"
            "shipped"
          when "shipped"
            "退货"
          when "order_cancelled"
            "确认退货"
          when "good_returned"
            "退货完成"
          else
            "订单完成"
        end
      end

      def return_good

      end

end
