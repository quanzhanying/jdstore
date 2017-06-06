class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders

  has_many :favorites

  has_many :favorite_products, :through => :favorites, :source => :product


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def is_member_of?(product)
    favorite_products.include?(product)
  end

  def favorite!(product)
    favorite_products << product
  end

  def unfavorite!(product)
    favorite_products.delete(product)
  end

end
