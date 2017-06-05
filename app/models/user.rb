class User < ApplicationRecord
  has_many :orders
  has_many :favorites
  has_many :products, through: :favorites, source: :product
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def admin?
    is_admin
   end

end
