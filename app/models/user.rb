class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable

  has_many  :orders

  def admin?
    is_admin
  end

end
