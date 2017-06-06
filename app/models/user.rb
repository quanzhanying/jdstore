class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :orders

  def admin?
    is_admin
  end

  has_many :loves
  has_many :loved_products, :through => :loves, :source => :product

  def is_like?(product)
    loved_products.include?(product)
  end

  def like!(product)
    loved_products << product
  end

  def unlike!(product)
    loved_products.delete(product)
  end

end
