class User < ApplicationRecord
   has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def admin?
    email == '20170308@qq.com'
end

end
