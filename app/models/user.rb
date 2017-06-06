class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :orders

  def admin?
    is_admin
  end

  has_many :favorites
  has_many :favorited_products, :through => :favorites, :source => :product

end
