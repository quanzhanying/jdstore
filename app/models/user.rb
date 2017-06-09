class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #validates :nickname, presence: true   #限制用户名不得为空，这条禁止比较好，不会和display_name冲突

  validates_uniqueness_of :nickname    #限制用户名唯一

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

  def display_name
    if self.nickname.present?
      self.nickname
    else
      self.email.split("@").first
    end
  end
end
