class Order < ApplicationRecord
	include AASM
	belongs_to :user
	has_many :product_lists

	validates :billing_name, presence: true
	validates :billing_address, presence: true
	validates :shipping_name, presence: true
	validates :shipping_address, presence: true

	before_create :generate_token

	def generate_token
		self.token = SecureRandom.uuid
	end

	def paid_wechat!
		self.is_paid = true
		self.payment_method = "Wechat"
		self.save
	end

	def paid_alipay!
		self.is_paid = true
		self.payment_method = "Alipay"
		self.save
	end


	aasm do
		state :order_placed, initial: true
		state :paid
		state :shipping
		state :shipped
		state :order_cancelled
		state :good_returned

# Step 1 - Order created (no AASM action)

# Step 2 - Order paid (by user)
		event :make_payment do
			transitions from: :order_placed, to: :paid
		end

# Step 3 - Order already paid, so admin ships order (by admin)
		event :ship do
			transitions from: :paid, 				 to: :shipping
		end

# Step 4 - User receives shipment, changes status to "shipped" (by user)
		event :deliver do
			transitions from: :shipping,		 to: :shipped
		end

# Step 5 - User returns good (by user)
		event :return_good do
			transitions from: :shipped, 		 to: :good_returned
		end

# Possibility 1 - Admin cancels order for user
		event :cancel_order do
			transitions from: [:order_placed, :paid], to: :order_cancelled
		end

	end


end
