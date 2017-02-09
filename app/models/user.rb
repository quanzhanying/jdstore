class User < ApplicationRecord
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # def admin?
 #   is_admin
 #  end

 def admin?
    # email == 'cdf@newborn.com'
     is_admin
  end
end
