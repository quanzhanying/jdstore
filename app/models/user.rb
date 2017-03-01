class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def admin?
  is_admin
end

has_many :orders
has_many :reviews

has_many :product_relationships
has_many :collected_products, through: :product_relationships, source: :product

def has_collected?(product)
  collected_products.include?(product)
end

def collect!(product)
  collected_products << product
end

def discollect!(product)
  collected_products.delete(product)
end

end
