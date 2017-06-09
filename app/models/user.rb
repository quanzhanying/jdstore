class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :favorites
  has_many :favorited_products, :through => :favorites, :source => :product
  has_many :comments


  def admin?
    is_admin
  end

#判断是否收藏过该商品
  def is_like?(product)
    favorited_products.include?(product)
  end

  def like!(product)
    favorited_products << product
  end

  def unlike!(product)
    favorited_products.delete(product)
  end

end
