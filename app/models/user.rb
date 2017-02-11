class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :orders

         def admin?
           is_admin
         end

         def manager!
           self.is_admin = true
           self.save
         end

         def consumer!
           self.is_admin = false
           self.save
         end
end
