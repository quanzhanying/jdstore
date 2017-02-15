class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :favorites
  has_many :favorite_products, :through => :favorites, :source => :product

  def admin?
    is_admin
  end

  def is_favorite_of?(product)
    favorite_products.include?(product)
  end
end
