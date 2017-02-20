class Order < ApplicationRecord
    belongs_to :user
    has_many :product_lists
    before_create :generate_token

    validates :billing_name, presence: true
    validates :billing_address, presence: true
    validates :shipping_name, presence: true
    validates :shipping_address, presence: true

    def generate_token
        self.token = SecureRandom.uuid
  end
end
