class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  scope :all_except, -> (user) {where.not(id: user)}
   has_many :cars
   has_many :products
   has_many :orders
   has_many :posts

end
