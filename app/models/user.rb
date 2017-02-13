class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end
# is_admin 是个users里的table，呼叫admin？输出boolean值
#    email == 'lilei@sina.com'

   has_many :orders
end
