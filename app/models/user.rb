class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  has_many :likes
  has_many :liked_products, through: :likes, source: :product
  has_many :reviews


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def has_liked?(product)
    liked_products.include?(product)
  end

  def like!(product)
    liked_products << product
  end

  def unlike!(product)
    liked_products.delete(product)
  end

end
